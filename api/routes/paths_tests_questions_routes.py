from controllers.paths_tests_questions import Tests_Questions
from app import app, db
from flask_cors import cross_origin
from flask_jwt_extended import jwt_required

#/paths_tests_questions-----------------------------------------------------------------#

@app.route('/paths/<int:path_id>/tests/<int:test_id>/questions', methods=['GET'])
@jwt_required()
@cross_origin()
def tests_questions_get_all(path_id, test_id):
    return Tests_Questions(db).get_all_test_questions(path_id, test_id)

@app.route('/paths/<int:path_id>/tests/<int:test_id>/questions/<int:question_id>', methods= ['GET'])
@jwt_required()
@cross_origin()
def tests_questions_get_one(path_id, test_id, question_id):
    return Tests_Questions(db).get_one_test_question(path_id, test_id, question_id)