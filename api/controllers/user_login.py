
from lib.response_parser import Response_Parser
from flask import jsonify
from flask_jwt_extended import create_access_token

class UserLogin:
    def __init__(self, conn):
        self.conn = conn



    def login(self, data):
        nickname = data["nickname"]
        password = data["password"]
    
        sql_statement = "SELECT * FROM users WHERE nickname = '{0}' and \"password\" = '{1}'".format(nickname,  password)
        response = self.conn.engine.execute(sql_statement)
        for row in response:
            if((row.nickname == nickname) and (row.password == password)):
                message = "login succesful"
                access_token = create_access_token(identity=row.nickname, expires_delta=False)
                return jsonify({"AccessToken": access_token, "message": message, "is_admin":row.is_admin, "lang":row.lang, "user_id":row.id}), 200
                
        return jsonify({'Message': "User and password does not match"}), 401