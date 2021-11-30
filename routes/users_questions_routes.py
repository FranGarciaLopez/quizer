from flask import request
from controllers.user_questions import UserQuestions
from __main__ import app, db

#user/questions--------------------------------------------------------------#
@app.route('/users/<int:user_id>/questions/<int:question_id>', methods=['POST'])
def user_question_post(user_id, question_id):
    return UserQuestions(db).post(user_id, question_id)

@app.route('/users/<int:user_id>/questions', methods=['GET'])
def users_questions_get(user_id):
    return UserQuestions(db).get_all(user_id)

@app.route('/users/<int:user_id>/questions/<int:question_id>', methods=['GET'])
def user_question_get(user_id, question_id):
    return UserQuestions(db).get_one(user_id, question_id)

@app.route('/users/<int:user_id>/questions/<int:question_id>', methods=['GET'])
def user_question_put(user_id, question_id):
    return UserQuestions(db).put(user_id, question_id)

@app.route('/users/<int:user_id>/questions/<int:question_id>', methods=['DELETE'])
def user_question_delete(user_id, question_id):
    return UserQuestions(db).delete(user_id, question_id)