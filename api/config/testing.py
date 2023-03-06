import os
class TestingConfig():
    TESTING = True
    DEBUG = True
    ENV = 'testing'

    JWT_SECRET_KEY = "5iNySaf97&NW"

    SQLALCHEMY_TRACK_MODIFICATIONS = False
    
    if os.environ.get('GITHUB_ACTIONS'):
        app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://postgres:changeme@localhost:5432/tfg-db"
    else:
        app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://postgres:changeme@host.docker.internal:5432/tfg-db"