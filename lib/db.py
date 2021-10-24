from lib.response_parser import Response_Parser

class Db:
    def __init__(self, conn):
        self.conn = conn
    
    def get_all_subelement(self, table_name, id_name, id_value):
        sql_statement = "SELECT * FROM {0} WHERE '{1}' = '{2}'"
        sql_statement = sql_statement.format(table_name, id_name, id_value)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.delete(response)

    def get_subelement(self, table_name, id_name, id_value, reference_name, reference_id):
        sql_statement = "SELECT * FROM {0} WHERE '{1}' = '{2}' and '{3}' = '{4}'"
        sql_statement = sql_statement.format(table_name, id_name, id_value, reference_name, reference_id)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.delete(response)

    def delete_all_subelement(self, table_name, id_name, id_value):
        sql_statement = "DELETE FROM {0} WHERE '{1}' = '{2}'"
        sql_statement = sql_statement.format(table_name, id_name, id_value)

        response = self.conn.engine.execute(sql_statement)
        return Response_Parser.delete(response)

    def delete_subelement(self, table_name, id_name, id_value, reference_name, reference_id):
        sql_statement = "DELETE FROM {0} WHERE '{1}' = '{2}' and '{3}' = '{4}'"
        sql_statement = sql_statement.format(table_name, id_name, id_value, reference_name, reference_id)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.delete(response)
