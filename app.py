
import flask
from flask import json, request, Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from werkzeug.wrappers import response

from controllers.users import Users
from controllers.tests import Tests
from controllers.resources import Resources
from controllers.questions import Questions
from controllers.topics import Topics
from controllers.users_tests import UsersTests
from controllers.users_resources import UsersResources

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://postgres:changeme@localhost:5432/tfg-db"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']= False

db = SQLAlchemy(app)
migrate = Migrate(app, db)

#/users-----------------------------------------------------------------#
@app.route('/users', methods = ['POST'])
def user_post():
    return Users(db).post(request.json)

@app.route('/users', methods=['GET'])
def users_get():
    return Users(db).get_all()

@app.route('/users/<int:user_id>', methods= ['GET'])
def user_get(user_id):
    return Users(db).get_one(user_id)
""" 
@app.route('/users/<int:user_id>', methods=['PUT'])
def user_put(user_id):
    return Users(db).put(user_id) """

@app.route('/users/<int:user_id>', methods=['DELETE'])
def user_delete(user_id):
    return Users(db).delete(user_id)

#/tests-----------------------------------------------------------------#
@app.route('/tests', methods=['POST'])
def tests_post():
    return Tests(db).post(request.json)

@app.route('/tests', methods=['GET'])
def tests_get():
    return Tests(db).get_all()

@app.route('/tests/<test_id>', methods= ['GET'])
def test_get(test_id):
    return Tests(db).get_one(test_id)
""" 
@app.route('/tests/<int:test_id>', methods=['PUT'])
def test_put(test_id):
    return Tests(db).put(test_id) """

@app.route('/tests/<int:test_id>', methods=['DELETE'])
def test_delete(test_id):
    return Tests(db).delete(test_id)

#/resources-----------------------------------------------------------------#
@app.route('/resources', methods=['POST'])
def resources_post():
    return Resources(db).post(request.json)

@app.route('/resources', methods=['GET'])
def resources_get():
    return Resources(db).get_all()

@app.route('/resources/<int:topic_id>', methods= ['GET'])
def resource_get(topic_id):
    return Resources(db).get_one(topic_id)
""" 
@app.route('/resources/<int:topic_id>', methods=['PUT'])
def resource_put(topic_id):
    return Resources(db).put(topic_id) """

@app.route('/resources/<int:topic_id>', methods=['DELETE'])
def resource_delete(topic_id):
    return Resources(db).delete(topic_id)

#/questions-----------------------------------------------------------------#
@app.route('/questions', methods=['POST'])
def questions_post():
    return Questions(db).post(request.json)

@app.route('/questions', methods=['GET'])
def questions_get():
    return Questions(db).get_all()

@app.route('/questions/<int:question_id>', methods= ['GET'])
def question_get(question_id):
    return Questions(db).get_one(question_id)
""" 
@app.route('/questions/<int:question_id>', methods=['PUT'])
def question_put(question_id):
    return Questions(db).put(question_id) """

@app.route('/questions/<int:question_id>', methods=['DELETE'])
def question_delete(question_id):
    return Questions(db).delete(question_id)

#topics----------------------------------------------------------------------#
@app.route('/topics', methods=['POST'])
def topics_post():
    return Topics(db).post(request.json)

@app.route('/topics', methods=['GET'])
def topics_get():
    return Topics(db).get_all()

@app.route('/topics/<int:topic_id>', methods= ['GET'])
def topic_get(topic_id):
    return Topics(db).get_one(topic_id)
""" 
@app.route('/topics/<int:topic_id>', methods=['PUT'])
def topic_put(topic_id):
    return Topics(db).put(request.json, topic_id) """

@app.route('/topics/<int:topic_id>', methods=['DELETE'])
def topic_delete(topic_id):
    return Topics(db).delete(topic_id)


#user/tests--------------------------------------------------------------#
@app.route('/users/<int:user_id>/tests/<int:test_id>', methods=['POST'])
def user_test_post(user_id, test_id):
    return UsersTests(db).post(user_id, test_id)

@app.route('/users/<int:user_id>/tests', methods=['GET'])
def users_tests_get(user_id):
    return UsersTests(db).get_all(user_id)

@app.route('/users/<int:user_id>/tests/<int:test_id>', methods=['GET'])
def user_test_get(user_id, test_id):
    return UsersTests(db).get_one(user_id, test_id)

@app.route('/users/<int:user_id>/tests/<int:test_id>', methods=['DELETE'])
def user_test_delete(user_id, test_id):
    return UsersTests(db).delete(user_id, test_id)

#user/resources-----------------------------------------------------------#
@app.route('/users/<int:user_id>/resources/<int:topic_id>', methods=['POST'])
def user_resource_post(user_id, topic_id):
    return UsersResources(db).post(user_id, topic_id)

@app.route('/users/<int:user_id>/resources', methods=['GET'])
def users_resources_get(user_id):
    return UsersResources(db).get_all(user_id)

@app.route('/users/<int:user_id>/resources/<int:topic_id>', methods=['GET'])
def user_resource_get(user_id, topic_id):
    return UsersResources(db).get_one(user_id, topic_id)

@app.route('/users/<int:user_id>/resources/<int:topic_id>', methods=['DELETE'])
def user_resource_delete(user_id, topic_id):
    return UsersResources(db).delete(user_id, topic_id)

if __name__ == "__main__":
    app.run(port=3000,debug=True)

