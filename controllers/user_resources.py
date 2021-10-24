import flask
import json
from flask import jsonify
from lib.response_parser import Response_Parser

class UserResources:
    def __init__(self, conn):
        self.conn = conn

    def post(self, user_id, topic_id):
        sql_statement = "INSERT INTO user_resources (user_id, topic_id) VALUES ('{0}','{1}')"
        sql_statement = sql_statement.format(user_id, topic_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.post(response)
        
    def get_all(self, user_id):        
        sql_statement = "SELECT * FROM user_resources where user_id = '{0}'"
        sql_statement = sql_statement.format(user_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)
    
    def get_one(self, user_id, topic_id):
        sql_statement = "SELECT * FROM user_resources WHERE user_id = '{0}' and topic_id = '{1}'"
        sql_statement = sql_statement.format(user_id, topic_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)
 
    def delete_all(self, user_id):
        sql_statement = "DELETE FROM user_resources WHERE user_id = '{0}'"
        sql_statement = sql_statement.format(user_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.delete(response)

    def delete(self, user_id, topic_id):
        sql_statement = "DELETE FROM user_resources WHERE user_id = '{0}' and topic_id = '{1}'"
        sql_statement = sql_statement.format(user_id, topic_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.delete(response)
