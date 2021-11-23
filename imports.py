from flask import request, Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_swagger_ui import get_swaggerui_blueprint

from controllers.users import Users
from controllers.tests import Tests
from controllers.resources import Resources
from controllers.questions import Questions
from controllers.topics import Topics
from controllers.user_tests import UserTests
from controllers.user_resources import UserResources
from controllers.user_questions import UserQuestions
from controllers.user_paths import UserPaths
