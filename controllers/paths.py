import json
from lib.response_parser import Response_Parser
from lib.db import Db

class Paths:
    def __init__(self, conn):
        self.conn = conn

    def post(self, data):
        name = json.dumps(data["name"])
        desc = json.dumps(data["desc"])
        type = "psyco"

        sql_statement = "INSERT INTO paths (\"name\", \"desc\", \"type\") VALUES ('{0}', '{1}', '{2}');"
        sql_statement = sql_statement.format(name, desc, type)
        print(sql_statement)
        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.post(response)
        
    def get_all(self):
        sql_statement = """
            select p.id, p.name, p.desc, p."type" , p.subtype, p.requirements, p.created, p.updated, count(t.id) as test_count from paths p
            left join tests t on t.path_id = p.id
            group by p.id, p.name, p.desc, p."type" , p.subtype, p.requirements, p.created, p.updated
            ORDER BY p.id ASC

        """

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)
    
    def get_one(self, path_id):
        sql_statement = "SELECT * FROM paths WHERE id = '{0}'"
        sql_statement = sql_statement.format(path_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)
   
    def put(self, data, path_id):
        name = json.dumps(data["name"])
        desc = json.dumps(data["desc"])

        sql_statement = "UPDATE paths SET \"name\"='{0}', \"desc\"='{1}', \"type\"='psyco' WHERE id={2}".format(name, desc, path_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.put(response)

    def delete_all(self, table_name, id_name, id_value):
        Db.delete_all_subelement(self, table_name, id_name, id_value)
    
    def delete(self, path_id):
        sql_statement = "DELETE FROM paths WHERE id = '{0}'"
        sql_statement = sql_statement.format(path_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.delete(response)
    
