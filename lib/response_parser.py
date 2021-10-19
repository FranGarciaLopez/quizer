from flask import jsonify

class Response_Parser:

    def post(sql_response):
        if sql_response == None:
            return jsonify({'Message': "No response"}), 500
        return jsonify({'Message': "Inserted"}), 201
    
    def get(sql_response):
        if sql_response == None:
            return jsonify({"Message":"The data does not exists."}), 404

        sql_response = [
            {column:value for column, value in row._mapping.items()}
            for row in sql_response]
        return jsonify(sql_response), 200

    def put(sql_response):
        return jsonify({"Message": "Updated"}), 200

    def delete(sql_response):
        if sql_response == None:
            return jsonify({'Message': "No responde"})  , 500
        return jsonify({'Message': "Deleted"}), 200
        

Response_Parser.get = staticmethod(Response_Parser.get)