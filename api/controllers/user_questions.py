import json
from lib.response_parser import Response_Parser
from lib.db import Db

class UserQuestions:
    def __init__(self, conn):
        self.conn = conn

    def post(self, user_id, question_id):
        sql_statement = "INSERT INTO user_questions (user_id, question_id) VALUES ('{0}','{1}')".format(user_id, question_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.post(response)
        
    def get_all(self, user_id, path_id, test_id, next_id):
        sql_statement = """select q.* from questions q
            left join user_tests ut on ut.test_id = q.test_id where ut.test_id = {2} and q.order = {3}
            order by q."order" desc limit 1""".format(user_id, path_id, test_id, next_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)

    def get_last_question(self, user_id, path_id, test_id):
        sql_statement = """select q.order 
            from questions q left join user_questions uq on q.test_id = uq.test_id
            where q.test_id = {2} and uq.user_id = {0}
            order by q.order desc limit 1""".format(user_id, path_id, test_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)

    def put(self, user_id, question_id):
        sql_statement = "UPDATE user_questions SET user_id = '{0}', question_id = '{1}'".format(user_id, question_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.put(response)

    def delete_all(self, table_name, id_name, id_value):
        Db.delete_all_subelement(self, table_name, id_name, id_value)

    def delete(self, user_id, question_id):
        sql_statement = "DELETE FROM user_questions WHERE user_id = '{0}' and question_id = '{1}'".format(user_id, question_id)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.delete(response)
    
