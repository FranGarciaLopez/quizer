from controllers.user_questions import UserQuestions
from app import app, db
from flask_cors import cross_origin
from flask import request, jsonify


#user/questions--------------------------------------------------------------#
@app.route('/users/<int:user_id>/tests/<int:test_id>/questions/<int:question_id>', methods=['POST'])
def user_question_post(user_id, test_id, question_id):
    return UserQuestions(db).post(request.json, user_id, test_id, question_id)


@app.route('/users/<int:user_id>/tests/<int:test_id>/questions/<int:question_id>', methods=['PUT'])
def user_question_put(user_id, test_id, question_id):
    return UserQuestions(db).put(request.json, user_id, test_id, question_id)


@app.route('/users/<int:user_id>/paths/<int:path_id>/tests/<int:test_id>/questions/<int:next_question>', methods=['GET'])
@cross_origin()
def user_question_get(user_id, path_id, test_id, next_question):
    return UserQuestions(db).get_all(user_id, path_id, test_id, next_question)

@app.route('/users/<int:user_id>/paths/<int:path_id>/tests/<int:test_id>/last_question', methods=['GET'])
@cross_origin()
def user_question_get_last(user_id, path_id, test_id):
    return UserQuestions(db).get_last_question(user_id, path_id, test_id)

@app.route('/users/<int:user_id>/questions/<int:question_id>', methods=['DELETE'])
def user_question_delete(question_id, user_id):
    return UserQuestions(db).delete_one(question_id, user_id)