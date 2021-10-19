import re
from warnings import resetwarnings
import flask
import json
from flask import jsonify
from werkzeug.wrappers import response
from lib.response_parser import Response_Parser

class Resources:
    def __init__(self, db):
        self.db = db

    def post(self, data):
        name = json.dumps(data["name"])
                
        sql_statement = "INSERT INTO resources (name) VALUES ('{0}')"
        sql_statement = sql_statement.format(name)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.post(response)
        
    def get_all(self):

        sql_statement = "SELECT * FROM resources"

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.get(response)
    
    def get_one(self, data):
        topic_id = data
        
        sql_statement = "SELECT * FROM resources WHERE id = '{0}'"
        sql_statement = sql_statement.format(topic_id)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.get(response)

    def delete(self, data):
        topic_id = data

        sql_statement = "DELETE FROM resources WHERE id = '{0}'"
        sql_statement = sql_statement.format(topic_id)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.delete(response)
    
