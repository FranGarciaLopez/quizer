from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flasgger import Swagger
from flask_jwt_extended import JWTManager
from flask_cors import CORS

app = Flask(__name__)

CORS(app)
jwt = JWTManager(app)

app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://postgres:changeme@localhost:5432/tfg-db"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']= False

app.config["JWT_SECRET_KEY"] = "super-secret"

app.config["SWAGGER"] = {"title": "Swagger-UI", "uiversion": 2}
swagger_config = {
    "headers":[],
    "specs":[
        {
            "endpoint":"apispec_1",
            "route":"/apispec_1.json",
            "rule_filter":lambda rule: True,
            "model_filter":lambda tag: True,
        }
    ],
    "static_url_path":"/flasgger_static",
    "swagger_ui": True,
    "specs_route":"/swagger/"
}

swagger = Swagger(app, config=swagger_config)
db = SQLAlchemy(app)
migrate = Migrate(app, db)

from routes.routes import *


if __name__ == "__main__":
    app.run(port=3000, debug = True)

