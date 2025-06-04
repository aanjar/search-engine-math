from flask import Blueprint, render_template, request
from app.models.db import search_pages

search_bp = Blueprint("search", __name__)

@search_bp.route("/")
def index():
    query = request.args.get("q", "")
    results = search_pages(query) if query else []
    return render_template("search.html", results=results, query=query)
