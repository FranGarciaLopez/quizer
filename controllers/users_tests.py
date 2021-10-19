import re
from warnings import resetwarnings
import flask
import json
from flask import jsonify
from werkzeug.wrappers import response
from lib.response_parser import Response_Parser

class UsersTests:
    def __init__(self, db):
        self.db = db

    def post(self, data):
        user_id = data["user_id"]
        test_id = data["test_id"]
        
        sql_statement = "INSERT INTO user_tests (user_id, test_id) VALUES ('{0}','{1}')"
        sql_statement = sql_statement.format(user_id, test_id)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.post(response)
        
    def get_all(self, Userdata):
        user_id = Userdata
        
        sql_statement = "SELECT * FROM user_tests where user_id = '{0}'"
        sql_statement = sql_statement.format(user_id)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.get(response)
    
    def get_one(self, Userdata, Testdata):
        user_id = Userdata
        test_id = Testdata

        sql_statement = "SELECT * FROM user_tests WHERE user_id = '{0}' and test_id = '{1}'"
        sql_statement = sql_statement.format(user_id, test_id)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.get(response)

    def delete(self, Userdata, Testdata):
        user_id = Userdata
        test_id = Testdata

        sql_statement = "DELETE FROM user_tests WHERE user_id = '{0}' and test_id = '{1}'"
        sql_statement = sql_statement.format(user_id, test_id)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.delete(response)
    
