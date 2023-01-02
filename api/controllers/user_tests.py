from lib.response_parser import Response_Parser
from lib.db import Db

class UserTests:
    def __init__(self, conn):
        self.conn = conn

    def post(self, user_id, test_id):
        sql_statement = "INSERT INTO user_tests (user_id, test_id) VALUES ('{0}','{1}')".format(user_id, test_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.post(response)
        
    def get_all(self, user_id, path_id):
        sql_statement = """
            SELECT DISTINCT up.path_id, up.user_id, t."name", t.conclusion, t."desc", t.id, ut.acc_results
            FROM user_paths up 
            LEFT JOIN tests t on t.path_id = up.path_id 
            LEFT JOIN user_tests ut on t.id = ut.test_id AND ut.user_id = {0}
            WHERE up.path_id = {1}
            ORDER BY t.id ASC
        """.format(user_id, path_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)
    
    def get_one(self, user_id, test_id):
        sql_statement = "SELECT * FROM user_tests WHERE user_id = '{0}' and test_id = '{1}'".format(user_id, test_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)

    def put(self, user_id, test_id):
        sql_statement = "UPDATE users_tests SET user_id = '{0}', test_id = '{1}'".format(user_id, test_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.put(response)

    def delete_all(self, table_name, id_name, id_value):
        Db.delete_all_subelement(self, table_name, id_name, id_value)

    def delete(self, user_id, test_id):
        sql_statement = "DELETE FROM user_tests WHERE user_id = '{0}' and test_id = '{1}'".format(user_id, test_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.delete(response)
    
