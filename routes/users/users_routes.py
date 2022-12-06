from flask import request
from controllers.users import Users
from __main__ import app, db
from flask_cors import cross_origin
from flasgger.utils import swag_from
from flask_jwt_extended import jwt_required

#/users-----------------------------------------------------------------#
@app.route('/users', methods = ['POST'])
@jwt_required()
def user_post():
    return Users(db).post(request.json)

@app.route('/users', methods=['GET'])
@swag_from("path/to/users.yml")
@jwt_required()
@cross_origin()
def users_get():
    return Users(db).get_all()

@app.route('/users/<int:user_id>', methods= ['GET'])
@jwt_required()
@cross_origin()
def user_get(user_id):
    return Users(db).get_one(user_id)

@app.route('/users/<int:user_id>', methods=['PUT'])
@jwt_required()
@cross_origin()
def user_put(user_id):
    return Users(db).put(user_id, request.json)

@app.route('/users/<int:user_id>', methods=['DELETE'])
@jwt_required()
def user_delete(user_id):
    return Users(db).delete(user_id)