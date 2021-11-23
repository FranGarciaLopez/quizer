import json
from lib.response_parser import Response_Parser

class Topics:
    def __init__(self, conn):
        self.conn = conn

    def post(self, data):
        name = json.dumps(data["name"])
                        
        sql_statement = "INSERT INTO topics (name) VALUES ('{0}')"
        sql_statement = sql_statement.format(name)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.post(response)
        
    def get_all(self):
        sql_statement = "SELECT * FROM topics"

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)
    
    def get_one(self, topic_id):
        sql_statement = "SELECT * FROM topics WHERE topic_id = '{0}'"
        sql_statement = sql_statement.format(topic_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)

    def put(self, topic_id, data):
        name = json.dumps(data["name"])

        sql_statement = "UPDATE topics SET name = '{0}' WHERE topic_id = '{1}'"
        sql_statement = sql_statement.format(name, topic_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.put(response)

    def delete(self, topic_id):
        sql_statement = "DELETE FROM topics WHERE topic_id = '{0}'"
        sql_statement = sql_statement.format(topic_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.delete(response)
    
