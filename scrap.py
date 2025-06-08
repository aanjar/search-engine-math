from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
import mysql.connector
from collections import deque
import time
import urllib.parse
import os

START_URL = "https://elektro.um.ac.id"
DOMAIN = "elektro.um.ac.id"

EXCLUDED_EXTENSIONS = [
    '.pdf', '.doc', '.docx', '.xls', '.xlsx', '.ppt', '.pptx',
    '.jpg', '.jpeg', '.png', '.gif', '.svg',
    '.zip', '.rar', '.7z', '.tar', '.gz',
    '.mp3', '.mp4', '.avi', '.mov', '.mkv', '.wav',
    '.exe', '.iso', '.apk'
]

def connect_db():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="scraping_elektro"
    )

def insert_page(db, url, title, content):
    cursor = db.cursor()
    cursor.execute("INSERT IGNORE INTO crawler (url, judul, konten) VALUES (%s, %s, %s)", (url, title, content))
    db.commit()
    cursor.execute("SELECT id FROM crawler WHERE url = %s", (url,))
    return cursor.fetchone()[0]

def insert_link(db, from_node, to_node):
    cursor = db.cursor()
    cursor.execute("INSERT INTO hyperlink (from_node, to_node) VALUES (%s, %s)", (from_node, to_node))
    db.commit()

def normalize_url(url):
    url = urllib.parse.urldefrag(url)[0]
    return url.rstrip('/')

def should_exclude_url(url):
    parsed = urllib.parse.urlparse(url)
    path = parsed.path.lower()
    _, ext = os.path.splitext(path)
    return ext in EXCLUDED_EXTENSIONS

def bfs_crawl(start_url):
    db = connect_db()
    visited = set()
    queue = deque()

    options = Options()
    driver = webdriver.Chrome(options=options)

    queue.append((start_url, None))

    while queue:
        current_url, parent_id = queue.popleft()
        current_url = normalize_url(current_url)

        if current_url in visited:
            continue
        visited.add(current_url)

        try:
            driver.get(current_url)
            time.sleep(1)

            CONTENT_SELECTORS = {
                "entry-content": ("p", None),          
                "et_pb_section_3": ("div", "et_pb_text_inner"),  
            }
            
            title = driver.title
            content_parts = []
            for cls, (tag, sub_class) in CONTENT_SELECTORS.items():
                try:
                    container = driver.find_element(By.CLASS_NAME, cls)
                    if sub_class is None:
                        elements = container.find_elements(By.TAG_NAME, tag)
                    else:
                        elements = container.find_elements(By.CSS_SELECTOR, f"{tag}.{sub_class}")
                    
                    for el in elements:
                        text = el.text.strip()
                        if text:
                            content_parts.append(text)
                except:
                    pass

            body = "\n".join(content_parts).strip()

            page_id = insert_page(db, current_url, title, body)

            if parent_id is not None:
                insert_link(db, parent_id, page_id)

            anchors = driver.find_elements(By.TAG_NAME, "a")
            for a in anchors:
                href = a.get_attribute("href")
                if href and DOMAIN in href:
                    clean_url = normalize_url(href)
                    if not should_exclude_url(clean_url) and clean_url not in visited:
                        queue.append((clean_url, page_id))


        except Exception as e:
            print(f"[ERROR] Gagal akses {current_url} → {e}")

    driver.quit()
    db.close()

if __name__ == "__main__":
    bfs_crawl(START_URL)
