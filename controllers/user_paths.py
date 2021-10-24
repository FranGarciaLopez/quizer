import flask
import json
from flask import jsonify
from lib.response_parser import Response_Parser
from lib.db import Db
class UserPaths:
    def __init__(self, conn):
        self.conn = conn

    def post(self, user_id, path_id):
        sql_statement = "INSERT INTO user_paths (user_id, path_id) VALUES ('{0}','{1}')"
        sql_statement = sql_statement.format(user_id, path_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.post(response)
        
    def get_all(self, user_id):
        sql_statement = "SELECT * FROM user_paths where user_id = '{0}'"
        sql_statement = sql_statement.format(user_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)
    
    def get_one(self, user_id, path_id):
        sql_statement = "SELECT * FROM user_paths WHERE user_id = '{0}' and path_id = '{1}'"
        sql_statement = sql_statement.format(user_id, path_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)

    def delete_all(self, table_name, id_name, id_value):
        Db.delete_all_subelement(self, table_name, id_name, id_value)

    def delete(self, user_id, path_id):
        sql_statement = "DELETE FROM user_paths WHERE user_id = '{0}' and path_id = '{1}'"
        sql_statement = sql_statement.format(user_id, path_id)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.delete(response)
    
