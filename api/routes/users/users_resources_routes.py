from controllers.user_resources import UserResources
from app import app, db
from flask_cors import cross_origin

#user/resources-----------------------------------------------------------#
@app.route('/users/<int:user_id>/resources/<int:topic_id>', methods=['POST'])
def user_resource_post(user_id, topic_id):
    return UserResources(db).post(user_id, topic_id)

@app.route('/users/<int:user_id>/resources', methods=['GET'])
@cross_origin()
def users_resources_get(user_id):
    return UserResources(db).get_all(user_id)

@app.route('/users/<int:user_id>/resources/<int:topic_id>', methods=['GET'])
@cross_origin()
def user_resource_get(user_id, topic_id):
    return UserResources(db).get_one(user_id, topic_id)

@app.route('/users/<int:user_id>/resources/<int:topic_id>', methods=['GET'])
def user_resources_put(user_id, topic_id):
    return UserResources(db).put(user_id, topic_id)

@app.route('/users/<int:user_id>/resources/<int:topic_id>', methods=['DELETE'])
def user_resource_delete(user_id, topic_id):
    return UserResources(db).delete(user_id, topic_id)
