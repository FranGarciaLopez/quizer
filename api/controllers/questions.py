import json
from lib.response_parser import Response_Parser
from lib.db import Db

class Questions:
    def __init__(self, conn):
        self.conn = conn

    def post(self, data):
        text = json.dumps(data["text"])
        answers = json.dumps(data["answers"])
        test_id = data["test_id"]
        order = data["order"]
                
        sql_statement = "INSERT INTO questions (text, answers, \"order\", test_id) VALUES ('{0}','{1}','{2}','{3}')"
        sql_statement = sql_statement.format(text, answers, order, test_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.post(response)
        
    def get_all(self):
        sql_statement = "SELECT * FROM questions ORDER BY id ASC"

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)
    
    def get_one(self, question_id):
        sql_statement = "SELECT * FROM questions WHERE id = '{0}'"
        sql_statement = sql_statement.format(question_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)
   
    def put(self, data, question_id):
        text = json.dumps(data["text"])
        answers = json.dumps(data["answers"])
        order = json.dumps(data["order"])

        sql_statement = "UPDATE questions SET text = '{0}', answers = '{1}', \"order\"='{2}' WHERE id = '{3}'".format(text, answers, order, question_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.put(response)

    def delete_all(self, test_id):
        sql_statement = "DELETE FROM questions WHERE test_id = '{0}'"
        sql_statement = sql_statement.format(test_id)
        
        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.delete(response)
        
    def delete(self, question_id):
        sql_statement = "DELETE FROM questions WHERE id = '{0}'"
        sql_statement = sql_statement.format(question_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.delete(response)
    
