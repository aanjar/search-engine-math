import mysql.connector

def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="tb_math2"
    )

def search_pages(keyword):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM pages WHERE title LIKE %s ORDER BY pagerank DESC", 
                   (f"%{keyword}%",))
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return results
