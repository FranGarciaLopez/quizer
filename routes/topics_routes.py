from flask import request
from controllers.topics import Topics
from __main__ import app, db
from flask_cors import cross_origin

#topics----------------------------------------------------------------------#
@app.route('/topics', methods=['POST'])
def topics_post():
    return Topics(db).post(request.json)

@app.route('/topics', methods=['GET'])
@cross_origin()
def topics_get():
    return Topics(db).get_all()

@app.route('/topics/<int:topic_id>', methods= ['GET'])
@cross_origin()
def topic_get(topic_id):
    return Topics(db).get_one(topic_id)

@app.route('/topics/<int:topic_id>', methods=['PUT'])
def topic_put(topic_id):
    return Topics(db).put(topic_id, request.json)

@app.route('/topics/<int:topic_id>', methods=['DELETE'])
def topic_delete(topic_id):
    return Topics(db).delete(topic_id)