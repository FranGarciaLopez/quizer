from imports import Topics, request
from __main__ import app, db

#topics----------------------------------------------------------------------#
@app.route('/topics', methods=['POST'])
def topics_post():
    return Topics(db).post(request.json)

@app.route('/topics', methods=['GET'])
def topics_get():
    return Topics(db).get_all()

@app.route('/topics/<int:topic_id>', methods= ['GET'])
def topic_get(topic_id):
    return Topics(db).get_one(topic_id)

@app.route('/topics/<int:topic_id>', methods=['PUT'])
def topic_put(topic_id):
    return Topics(db).put(topic_id, request.json)

@app.route('/topics/<int:topic_id>', methods=['DELETE'])
def topic_delete(topic_id):
    return Topics(db).delete(topic_id)