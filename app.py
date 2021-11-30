from flask import request, Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_swagger_ui import get_swaggerui_blueprint
from flask_cors import cross_origin

app = Flask(__name__)
cross_origin(app)

app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://postgres:changeme@localhost:5432/tfg-db"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']= False


db = SQLAlchemy(app)
migrate = Migrate(app, db)

from routes.routes import *

if __name__ == "__main__":
    app.run(port=3000)

