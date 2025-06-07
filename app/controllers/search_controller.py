from flask import Blueprint, render_template, request, jsonify
from app.pagerank import get_pagerank_scores
import mysql.connector

search_bp = Blueprint('search', __name__)

@search_bp.route('/')
def index():
    return render_template('search.html')

@search_bp.route('/about')
def about():
    return render_template('about.html')

@search_bp.route('/help')
def help():
    return render_template('help.html')

@search_bp.route('/privacy')
def privacy():
    return render_template('privacy.html')

@search_bp.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404

# API search endpoint
@search_bp.route('/api/search')
def api_search():
    query = request.args.get('q', '')
    conn = mysql.connector.connect(
        host='localhost', user='root', password='', database='scrap'
    )
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM crawler WHERE content LIKE %s", (f"%{query}%",))
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    pagerank_scores = get_pagerank_scores()
    for r in results:
        r['pagerank'] = float(pagerank_scores.get(r['id'], 0))
        r['title'] = r['title']
        r['snippet'] = r['content'][:200] + '...'
        r['id'] = r['id']
    results.sort(key=lambda x: x['pagerank'], reverse=True)
    return jsonify(results)

# API detail endpoint
@search_bp.route('/api/detail/<int:page_id>')
def api_detail(page_id):
    conn = mysql.connector.connect(
        host='localhost', user='root', password='', database='scrap'
    )
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM crawler WHERE id = %s", (page_id,))
    page = cursor.fetchone()
    cursor.execute("SELECT to_node FROM hyperlink WHERE from_node = %s", (page_id,))
    out_links = [row['to_node'] for row in cursor.fetchall()]
    cursor.close()
    conn.close()
    pagerank_scores = get_pagerank_scores()
    if page:
        page['pagerank'] = float(pagerank_scores.get(page['id'], 0))
        page['title'] = page['title']
        page['content_full'] = page['content']
        page['out_links'] = out_links
        page['id'] = page['id']
    return jsonify(page)
