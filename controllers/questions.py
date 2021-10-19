import re
from warnings import resetwarnings
import flask
import json
from flask import jsonify
from werkzeug.wrappers import response
from lib.response_parser import Response_Parser

class Questions:
    def __init__(self, db):
        self.db = db

    def post(self, data):
        test_id = data["test_id"]
        text = json.dumps(data["text"])
        answers = json.dumps(data["answers"])
                
        sql_statement = "INSERT INTO questions (test_id, text, answers) VALUES ('{0}','{1}','{2}')"
        sql_statement = sql_statement.format(test_id, text, answers)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.post(response)
        
    def get_all(self):

        sql_statement = "SELECT * FROM questions"

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.get(response)
    
    def get_one(self, data):
        question_id = data
        
        sql_statement = "SELECT * FROM questions WHERE id = '{0}'"
        sql_statement = sql_statement.format(question_id)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.get(response)
        
    def delete(self, data):
        question_id = data

        sql_statement = "DELETE FROM questions WHERE id = '{0}'"
        sql_statement = sql_statement.format(question_id)
        print(sql_statement)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.delete(response)
    
