from flask import request
from controllers.resources import Resources
from __main__ import app, db
from flask_cors import cross_origin

#resources-------------------------------------------------------#
@app.route('/resources', methods=['POST'])
def resources_post():
    return Resources(db).post(request.json)

@app.route('/resources', methods=['GET'])
@cross_origin()
def resources_get():
    return Resources(db).get_all()

@app.route('/resources/<int:topic_id>', methods= ['GET'])
@cross_origin()
def resource_get(topic_id):
    return Resources(db).get_one(topic_id)

@app.route('/resources/<int:topic_id>', methods=['PUT'])
def resource_put(topic_id):
    return Resources(db).put(topic_id)

@app.route('/resources/<int:topic_id>', methods=['DELETE'])
def resource_delete(topic_id):
    return Resources(db).delete(topic_id)