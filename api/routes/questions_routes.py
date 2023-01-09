from flask import request
from controllers.questions import Questions
from app import app, db
from flask_cors import cross_origin
from flask_jwt_extended import jwt_required

#/questions-----------------------------------------------------------------#
@app.route('/questions', methods=['POST'])
@jwt_required()
def questions_post():
    return Questions(db).post(request.json)

@app.route('/questions', methods=['GET'])
@jwt_required()
@cross_origin()
def questions_get():
    return Questions(db).get_all()

@app.route('/questions/<int:question_id>', methods= ['GET'])
@jwt_required()
@cross_origin()
def question_get(question_id):
    return Questions(db).get_one(question_id)

@app.route('/questions/<int:question_id>', methods=['PUT'])
@jwt_required()
def question_put(question_id):
    return Questions(db).put(request.json, question_id)

@app.route('/questions/<int:question_id>', methods=['DELETE'])
@jwt_required()
def question_delete(question_id):
    return Questions(db).delete(question_id)