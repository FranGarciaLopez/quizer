from controllers.questions import Questions
import json
from lib.response_parser import Response_Parser

class Paths_Tests:
    def __init__(self, conn):
        self.conn = conn

    def get_all_tests_path(self, path_id):
        sql_statement = """
            select t.id, t.name, t.desc, t.conclusion, t.created, t.updated, t.dimentions, t."key", t.priority, t.questions_day, t.questions_last, t.path_id, count(q.id) 
            as question_count from tests t left join questions q on q.test_id = t.id
            where t.path_id = '{0}'
            group by t.id, t.name, t.desc, t.conclusion, t.created, t.updated, t.dimentions, t."key", t.priority, t.questions_day, t.questions_last, t.path_id
            ORDER BY t.id ASC""".format(path_id)
        
        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)

 
    def get_one_test_path(self, path_id, test_id):
        sql_statement = """
            select t.id, t.name, t.desc, t.conclusion, t.created, t.updated, t.dimentions, t."key", t.priority, t.questions_day, t.questions_last, t.path_id, count(q.id) 
            as question_count from tests t left join questions q on q.test_id = t.id
            where t.path_id = '{0}' and t.id = {1}
            group by t.id, t.name, t.desc, t.conclusion, t.created, t.updated, t.dimentions, t."key", t.priority, t.questions_day, t.questions_last, t.path_id
            """.format(path_id, test_id)
        
        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.get(response)