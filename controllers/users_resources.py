import re
from warnings import resetwarnings
import flask
import json
from flask import jsonify
from werkzeug.wrappers import response
from lib.response_parser import Response_Parser

class UsersResources:
    def __init__(self, db):
        self.db = db

    def post(self, user_data, topic_data):
        user_id = user_data
        topic_id = topic_data
        
        sql_statement = "INSERT INTO user_resources (user_id, topic_id) VALUES ('{0}','{1}')"
        sql_statement = sql_statement.format(user_id, topic_id)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.post(response)
        
    def get_all(self, user_data):
        user_id = user_data
        
        sql_statement = "SELECT * FROM user_resources where user_id = '{0}'"
        sql_statement = sql_statement.format(user_id)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.get(response)
    
    def get_one(self, user_data, topic_data):
        user_id = user_data
        topic_id = topic_data

        sql_statement = "SELECT * FROM user_resources WHERE user_id = '{0}' and topic_id = '{1}'"
        sql_statement = sql_statement.format(user_id, topic_id)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.get(response)

    def delete(self, user_data, topic_data):
        user_id = user_data
        topic_id = topic_data

        sql_statement = "DELETE FROM user_resources WHERE user_id = '{0}' and topic_id = '{1}'"
        sql_statement = sql_statement.format(user_id, topic_id)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.delete(response)
    
