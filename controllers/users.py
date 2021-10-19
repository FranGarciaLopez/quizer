import re
from warnings import resetwarnings
import flask
import json
from flask import jsonify
from werkzeug.wrappers import response
from lib.response_parser import Response_Parser

class Users:
    def __init__(self, db):
        self.db = db

    def post(self, data):
        name = data["name"]
        surname = data["surname"]
        nickname = data["nickname"]
        lang = data["lang"]
        email = data["email"]
        telegram_id = data["telegram_id"]

        sql_statement = "INSERT INTO users (name, surname, nickname, lang, email, telegram_id) VALUES ('{0}','{1}','{2}','{3}','{4}','{5}')"
        sql_statement = sql_statement.format(name, surname, nickname, lang, email, telegram_id)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.post(response)
        
    def get_all(self):

        sql_statement = "SELECT * FROM users"

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.get(response)
    
    def get_one(self, data):
        users_id = data
        
        sql_statement = "SELECT * FROM users WHERE id = '{0}'"
        sql_statement = sql_statement.format(users_id)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.get(response)

    def delete(self, data):
        users_id = data

        sql_statement = "DELETE FROM users WHERE id = '{0}'"
        sql_statement = sql_statement.format(users_id)

        response = self.db.engine.execute(sql_statement)
        return Response_Parser.delete(response)
    
