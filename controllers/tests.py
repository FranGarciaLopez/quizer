import re
from warnings import resetwarnings
import flask
import json
from flask import jsonify
from werkzeug.wrappers import response
from lib.response_parser import Response_Parser

class Tests:
    def __init__(self, db):
        self.db = db

    def post(self, data):
        name = json.dumps(data["name"])
        desc = json.dumps(data["desc"])
        conclusion = json.dumps(data["conclusion"])
        
        sql_statement = "INSERT INTO tests (\"name\", \"desc\", conclusion) VALUES ('{0}','{1}','{2}')"
        sql_statement = sql_statement.format(name, desc, conclusion)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.post(response)
        
    def get_all(self):

        sql_statement = "SELECT * FROM tests"

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.get(response)
    
    def get_one(self, data):
        test_id = data
        
        sql_statement = "SELECT * FROM tests WHERE id = '{0}'"
        sql_statement = sql_statement.format(test_id)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.get(response)

    def delete(self, data):
        users_id = data

        sql_statement = "DELETE FROM tests WHERE id = '{0}'"
        sql_statement = sql_statement.format(users_id)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.delete(response)
    
