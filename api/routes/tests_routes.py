from flask import request
from controllers.tests import Tests
from __main__ import app, db
from flask_cors import cross_origin

#/tests-----------------------------------------------------------------#
@app.route('/tests', methods=['POST'])
def tests_post():
    return Tests(db).post(request.json)

@app.route('/tests', methods=['GET'])
@cross_origin()
def tests_get():
    return Tests(db).get_all()

@app.route('/tests/<test_id>', methods= ['GET'])
@cross_origin()
def test_get(test_id):
    return Tests(db).get_one(test_id)

@app.route('/tests/<int:test_id>', methods=['PUT'])
def test_put(test_id):
    return Tests(db).put(request.json, test_id)

@app.route('/tests/<int:test_id>', methods=['DELETE'])
def test_delete(test_id):
    return Tests(db).delete(test_id)