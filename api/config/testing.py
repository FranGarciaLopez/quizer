class TestingConfig():
    TESTING = True
    DEBUG = False
    ENV = 'testing'

    JWT_SECRET_KEY = "5iNySaf97&NW"

    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_DATABASE_URI = "postgresql://postgres:changeme@localhost:5432/tfg-db"