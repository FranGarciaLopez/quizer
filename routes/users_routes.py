from imports import Users, request
from __main__ import app, db

#/users-----------------------------------------------------------------#
@app.route('/users', methods = ['POST'])
def user_post():
    return Users(db).post(request.json)

@app.route('/users', methods=['GET'])
def users_get():
    return Users(db).get_all()

@app.route('/users/<int:user_id>', methods= ['GET'])
def user_get(user_id):
    return Users(db).get_one(user_id)

@app.route('/users/<int:user_id>', methods=['PUT'])
def user_put(user_id):
    return Users(db).put(user_id, request.json)

@app.route('/users/<int:user_id>', methods=['DELETE'])
def user_delete(user_id):
    return Users(db).delete(user_id)