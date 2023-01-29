from flask import request, jsonify
from controllers.user_login import UserLogin
from app import app, db
from flask_cors import cross_origin

#topics----------------------------------------------------------------------#

@app.route('/login', methods=['POST'])
@cross_origin()
def user_login_login():
    return UserLogin(db).login(request.json)

