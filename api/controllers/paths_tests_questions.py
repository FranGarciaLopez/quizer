from lib.response_parser import Response_Parser

class Tests_Questions:
    def __init__(self, conn):
        self.conn = conn

    def get_all_test_questions(self, path_id, test_id):
        sql_statement = """
            select q.id, q."text", q.answers, q."order" from questions q, tests t
            where t.path_id = {0} and t.id = {1} and q.test_id = t.id
            group by q.id, q."text", q.answers, q."order" order by id asc""".format(path_id, test_id)
        
        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)

 
    def get_one_test_question(self, path_id, test_id, question_id):
        sql_statement = """
            select q.id, q."text", q.answers, q."order" from questions q, tests t
            where t.path_id = {0} and t.id = {1} and q.test_id = t.id and q.id = {2}
            group by q.id, q."text", q.answers, q."order" order by id asc""".format(path_id, test_id, question_id)
        
        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)