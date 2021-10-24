import flask
import json
from lib.response_parser import Response_Parser

class UserTests:
    def __init__(self, conn):
        self.conn = conn
    
    """ 
    def post(self, user_id, test_id):
        sql_statement = "INSERT INTO user_tests (user_id, test_id, question_id) VALUES ('{0}','{1}')"
        sql_statement = sql_statement.format(user_id, test_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.post(response) """
        
    """ def get_all(self, user_id):
        sql_statement = "SELECT * FROM user_tests where user_id = '{0}'"
        sql_statement = sql_statement.format(user_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response) """
    
    def get_one(self, user_id, test_id, question_id):
        sql_statement = "SELECT * FROM user_tests WHERE user_id = '{0}' and test_id = '{1}' and question_id = '{2}'"
        sql_statement = sql_statement.format(user_id, test_id, question_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)

    def delete_all(self, user_id):
        sql_statement = "DELETE FROM user_tests WHERE user_id = '{0}'"
        sql_statement = sql_statement.format(user_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.delete(response)

    def delete(self, user_id, test_id, question_id):
        sql_statement = "DELETE FROM user_tests WHERE user_id = '{0}' and test_id = '{1}'and question_id = '{2}'"
        sql_statement = sql_statement.format(user_id, test_id, question_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.delete(response)
    
