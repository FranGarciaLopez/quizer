# quizer
This is the repo for a quizer web app.
If you want to try it, the api, the web are dockerized in a docker-compose file (container).
This code can be used to cloen the repo in your local machine "git clone https://github.com/FranGarciaLopez/quizer.git quizer" 
There is also a database script that may be executed when the docker container is runnng.
To include the database in the docker containtr you can use the following commands in the command line (created in WSL2), with docker installed.
docker exec -i postgres_container psql postgresql://postgres:changeme@localhost:5432 -c "CREATE DATABASE \"tfg-db\"" to create a database.
docker exec -i postgres_container psql -q -h localhost -p 5432 -U postgres -d tfg-db < tfg-db.sql, to restore the database into the new database previously created.
You can run some end-to-end tests made with nightwatch with the command "npm test" in the command line.
