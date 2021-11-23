import json
from lib.response_parser import Response_Parser
from lib.db import Db

class Questions:
    def __init__(self, conn):
        self.conn = conn

    def post(self, data):
        test_id = data["test_id"]
        text = json.dumps(data["text"])
        answers = json.dumps(data["answers"])
                
        sql_statement = "INSERT INTO questions (test_id, text, answers) VALUES ('{0}','{1}','{2}')"
        sql_statement = sql_statement.format(test_id, text, answers)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.post(response)
        
    def get_all(self):
        sql_statement = "SELECT * FROM questions"

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)
    
    def get_one(self, question_id):
        sql_statement = "SELECT * FROM questions WHERE id = '{0}'"
        sql_statement = sql_statement.format(question_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)
   
    def put(self, data):
        test_id = data["test_id"]
        text = json.dumps(data["text"])
        answers = json.dumps(data["answers"])

        sql_statement = "UPDATE tests SET test_id = '{0}', text = '{1}', answers = '{2}'".format(test_id, text, answers)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.put(response)

    def delete_all(self, table_name, id_name, id_value):
        Db.delete_all_subelement(self, table_name, id_name, id_value)
    
    def delete(self, question_id):
        sql_statement = "DELETE FROM questions WHERE id = '{0}'"
        sql_statement = sql_statement.format(question_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.delete(response)
    
