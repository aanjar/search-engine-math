from flask import Blueprint, render_template

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

# API routes will be handled by the backend team, but you can define placeholders
# @search_bp.route('/api/search')
# def api_search():
#     # This will be implemented by the backend team
#     pass

# @search_bp.route('/api/detail/<id>')
# def api_detail(id):
#     # This will be implemented by the backend team
#     pass
