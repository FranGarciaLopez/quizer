from flask import request
from controllers.paths_tests import Paths_Tests
from __main__ import app, db
from flask_cors import cross_origin
from flask_jwt_extended import jwt_required

#/paths_tests-----------------------------------------------------------------#

@app.route('/paths/<int:path_id>/tests', methods=['GET'])
@jwt_required()
@cross_origin()
def paths_tests_get_all(path_id):
    return Paths_Tests(db).get_all_tests_path(path_id)

@app.route('/paths/<int:path_id>/tests/<int:test_id>', methods= ['GET'])
@jwt_required()
@cross_origin()
def paths_tests_get_one(path_id, test_id):
    return Paths_Tests(db).get_one_test_path(path_id, test_id)

