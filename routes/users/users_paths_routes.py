from controllers.user_paths import UserPaths
from __main__ import app, db
from flask_cors import cross_origin

#user/paths--------------------------------------------------------------#
@app.route('/users/<int:user_id>/paths/<int:path_id>', methods=['POST'])
def user_path_post(user_id, path_id):
    return UserPaths(db).post(user_id, path_id)

@app.route('/users/<int:user_id>/paths', methods=['GET'])
@cross_origin()
def users_paths_get(user_id):
    return UserPaths(db).get_all(user_id)

@app.route('/users/<int:user_id>/paths/<int:path_id>', methods=['GET'])
@cross_origin()
def user_path_get(user_id, path_id):
    return UserPaths(db).get_one(user_id, path_id)

@app.route('/users/<int:user_id>/paths/<int:path_id>', methods=['GET'])
def user_path_put(user_id, path_id):
    return UserPaths(db).put(user_id, path_id)

@app.route('/users/<int:user_id>/paths/<int:path_id>', methods=['DELETE'])
def user_path_delete(user_id, path_id):
    return UserPaths(db).delete(user_id, path_id)
