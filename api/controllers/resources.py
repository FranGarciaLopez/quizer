import json
from lib.response_parser import Response_Parser

class Resources:
    def __init__(self, conn):
        self.conn = conn

    def post(self, data):
        name = json.dumps(data["name"])
                
        sql_statement = "INSERT INTO resources (name) VALUES ('{0}')".format(name)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.post(response)
        
    def get_all(self):
        sql_statement = "SELECT * FROM resources"

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)
    
    def get_one(self, id):
        sql_statement = "SELECT * FROM resources WHERE id = '{0}'".format(id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)
    
    def put(self, data):
        name = json.dumps(data["name"])

        sql_statement = "UPDATE resources SET name = '{0}'".format(name)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.put(response)

    def delete(self, id):
        sql_statement = "DELETE FROM resources WHERE id = '{0}'"
        sql_statement = sql_statement.format(id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.delete(response)
    
