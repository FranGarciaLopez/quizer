
from lib.response_parser import Response_Parser
from flask import jsonify
from flask_jwt_extended import create_access_token
import bcrypt

class UserLogin:
    def __init__(self, conn):
        self.conn = conn

    def compare_password(self, password, hashed_password):
        hashed_password = hashed_password.encode()
        return bcrypt.checkpw(password.encode('utf-8'), hashed_password)

    def login(self, data):
        incoming_password = data["password"]
        nickname = data["nickname"]
        # query the database to get the hashed password for the user
        sql_statement = "SELECT * FROM users WHERE nickname = '{0}'".format(nickname)
        response = self.conn.engine.execute(sql_statement)
        for row in response:
            if((row.nickname == nickname)):
                if self.compare_password(incoming_password, row.password):
                    message = "login successful"
                    access_token = create_access_token(identity=row.nickname, expires_delta=False)
                    return jsonify({"AccessToken": access_token, "message": message, "is_admin":row.is_admin, "lang":row.lang, "user_id":row.id}), 200
        return jsonify({'Message': "User not found"}), 401