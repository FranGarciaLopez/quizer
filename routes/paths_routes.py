from controllers.paths import Paths
from __main__ import app, db
from flask_cors import cross_origin
from flask_jwt_extended import jwt_required
from flask import request
#/paths-----------------------------------------------------------------#

@app.route('/paths', methods=['POST'])
@jwt_required()
@cross_origin()
def paths_post():
    return Paths(db).post(request.json)

@app.route('/paths', methods=['GET'])
@jwt_required()
@cross_origin()
def paths_get_all():
    return Paths(db).get_all()

@app.route('/paths/<int:path_id>', methods=['GET'])
@jwt_required()
@cross_origin()
def paths_get_one(path_id):
    return Paths(db).get_one(path_id)

    
@app.route('/paths/<int:path_id>', methods=['PUT'])
@jwt_required()
@cross_origin()
def paths_put(path_id):
    return Paths(db).put(request.json, path_id)


    
@app.route('/paths/<int:path_id>', methods=['DELETE'])
@jwt_required()
@cross_origin()
def paths_delete(path_id):
    return Paths(db).delete(path_id)