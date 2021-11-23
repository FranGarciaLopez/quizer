import json
from lib.response_parser import Response_Parser
from controllers.questions import Questions

class Tests:
    def __init__(self, conn):
        self.conn = conn

    def post(self, data):
        name = json.dumps(data["name"])
        desc = json.dumps(data["desc"])
        conclusion = json.dumps(data["conclusion"])
        
        sql_statement = "INSERT INTO tests (\"name\", \"desc\", conclusion) VALUES ('{0}','{1}','{2}')"
        sql_statement = sql_statement.format(name, desc, conclusion)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.post(response)
        
    def get_all(self):
        sql_statement = "SELECT * FROM tests"

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)
    
    def get_one(self, test_id):
        sql_statement = "SELECT * FROM tests WHERE id = '{0}'".format(test_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)

    def put(self, data):
        name = json.dumps(data["name"])
        desc = json.dumps(data["desc"])
        conclusion = json.dumps(data["conclusion"])

        sql_statement = "UPDATE tests SET \"name\" = '{0}', \"desc\" = '{1}', conclusion = '{2}'".format(name, desc, conclusion)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.put(response)

    def delete(self, test_id):
        Questions.delete_all(self, "questions", "test_id", test_id)
       
        sql_statement = "DELETE FROM tests WHERE id = '{0}'".format(test_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.delete(response)
    
