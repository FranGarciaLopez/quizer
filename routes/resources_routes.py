from imports import Resources, request
from __main__ import app, db

#resources-------------------------------------------------------#
@app.route('/resources', methods=['POST'])
def resources_post():
    return Resources(db).post(request.json)

@app.route('/resources', methods=['GET'])
def resources_get():
    return Resources(db).get_all()

@app.route('/resources/<int:topic_id>', methods= ['GET'])
def resource_get(topic_id):
    return Resources(db).get_one(topic_id)

@app.route('/resources/<int:topic_id>', methods=['PUT'])
def resource_put(topic_id):
    return Resources(db).put(topic_id)

@app.route('/resources/<int:topic_id>', methods=['DELETE'])
def resource_delete(topic_id):
    return Resources(db).delete(topic_id)