from flask import request
from controllers.questions import Questions
from __main__ import app, db

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

@app.route('/questions/<int:question_id>', methods=['PUT'])
def question_put(question_id):
    return Questions(db).put(question_id)

@app.route('/questions/<int:question_id>', methods=['DELETE'])
def question_delete(question_id):
    return Questions(db).delete(question_id)