from imports import UserTests, request
from __main__ import app, db

#user/tests--------------------------------------------------------------#
@app.route('/users/<int:user_id>/tests/<int:test_id>', methods=['POST'])
def user_test_post(user_id, test_id):
    return UserTests(db).post(user_id, test_id)

@app.route('/users/<int:user_id>/tests', methods=['GET'])
def users_tests_get(user_id):
    return UserTests(db).get_all(user_id)

@app.route('/users/<int:user_id>/tests/<int:test_id>', methods=['GET'])
def user_test_get(user_id, test_id):
    return UserTests(db).get_one(user_id, test_id)

@app.route('/users/<int:user_id>/tests/<int:test_id>', methods=['GET'])
def user_test_put(user_id, test_id):
    return UserTests(db).put(user_id, test_id)

@app.route('/users/<int:user_id>/tests/<int:test_id>', methods=['DELETE'])
def user_test_delete(user_id, test_id):
    return UserTests(db).delete(user_id, test_id)
