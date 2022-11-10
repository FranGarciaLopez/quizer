from flask import request
from controllers.topics import Topics
from __main__ import app, db
from flask_cors import cross_origin
from flask_jwt_extended import jwt_required

#topics----------------------------------------------------------------------#
@app.route('/topics', methods=['POST'])
@jwt_required()
def topics_post():
    return Topics(db).post(request.json)

@app.route('/topics', methods=['GET'])
@jwt_required()
@cross_origin()
def topics_get():
    return Topics(db).get_all()

@app.route('/topics/<int:topic_id>', methods= ['GET'])
@jwt_required()
@cross_origin()
def topic_get(topic_id):
    return Topics(db).get_one(topic_id)

@app.route('/topics/<int:topic_id>', methods=['PUT'])
@jwt_required()
def topic_put(topic_id):
    return Topics(db).put(topic_id, request.json)

@app.route('/topics/<int:topic_id>', methods=['DELETE'])
@jwt_required()
def topic_delete(topic_id):
    return Topics(db).delete(topic_id)