# Quizer

**Quizer** is a web application designed for users to test their knowledge. This repository contains all the necessary components for the app, including the API, web frontend, and database scripts.

## Getting Started

### 1. Clone the Repository:
```bash
git clone https://github.com/FranGarciaLopez/quizer.git quizer
2. Docker Setup:
The API and web frontend are containerized using Docker. You can set them up using the provided docker-compose file.

### 3. Database Setup:
Run the database script when the Docker container is active.
Use the following commands to set up the database within the Docker container (created in WSL2):
bash
Copy code
docker exec -i postgres_container psql postgresql://postgres:changeme@localhost:5432 -c "CREATE DATABASE \"tfg-db\""
docker exec -i postgres_container psql -q -h localhost -p 5432 -U postgres -d tfg-db < tfg-db.sql
4. Testing:
End-to-end tests are available using Nightwatch. Run the tests with:

bash
Copy code
npm test
Features and Implementation
Database: PostgreSQL with JSON data type support for multilingual content. Individual Docker file for app containerization.

API: RESTful API developed in Python. Features user authentication using the bcrypt method for password encryption. SQL interactions between the frontend and database are managed within the project's controllers' folder. Each controller has distinct endpoints for CRUD operations in the routes folder.

Backoffice: A CMS application for database CRUD operations using the above API. Features a login system that uses the same authentication method as the API, storing a JWT in the local storage.

Testing: Nightwatch is used for end-to-end tests to ensure the frontend operates as expected.

Dockerization and Refactoring: The components have been dockerized and refactored for optimal performance.

Frontend: Designed for non-admin users to log in and test their knowledge.
