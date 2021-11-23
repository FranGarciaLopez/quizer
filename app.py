from imports import *
from flask_cors import cross_origin

app = Flask(__name__)
cross_origin(app)

app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://postgres:changeme@localhost:5432/tfg-db"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']= False

#swagger config
SWAGGER_URL = '/swagger'
API_URL = '/static/swagger.json'
SWAGGER_BLUEPRINT = get_swaggerui_blueprint(
    SWAGGER_URL,
    API_URL,
    config = {
        'app_name' : 'Web tests with flask'
    }
)

app.register_blueprint(SWAGGER_BLUEPRINT, url_prefix = SWAGGER_URL)

db = SQLAlchemy(app)
migrate = Migrate(app, db)

#users-----------------------------------------------------------------#
from routes.users_routes import *

#/tests-----------------------------------------------------------------#
from routes.tests_routes import *

#/resources-----------------------------------------------------------------#
from routes.resources_routes import *

#/questions-----------------------------------------------------------------#
from routes.questions_routes import *

#topics----------------------------------------------------------------------#
from routes.topics_routes import *

#user/tests--------------------------------------------------------------#
from routes.users_tests_routes import *

#user/questions--------------------------------------------------------------#
from routes.users_questions_routes import *

#user/paths--------------------------------------------------------------#
from routes.users_paths_routes import *

#user/resources-----------------------------------------------------------#
from routes.users_resources_routes import *

if __name__ == "__main__":
    app.run(port=3000, debug=True)

