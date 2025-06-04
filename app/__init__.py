from flask import Flask

def create_app():
    app = Flask(__name__)

    from .controllers.search_controller import search_bp
    app.register_blueprint(search_bp)

    return app
