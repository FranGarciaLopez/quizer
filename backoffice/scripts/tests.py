import subprocess
import time
from os import path

subprocess.Popen('start docker exec -t postgres_container /bin/bash -c "pg_dump -U postgres tfg-db > /backup/tfg-db.sql"', stdout=subprocess.PIPE, shell=True)

api_dir = " C:\Users\Fran\code\quizer-api"
basepath = path.dirname(__file__)

api_server = subprocess.Popen('start python '+api_dir+'/app.py', stdout=subprocess.PIPE, shell=True)

backoffice_filepath = path.abspath(path.join(basepath, ".."))
backoffice_service = subprocess.Popen('start npm run serve', cwd=backoffice_filepath, stdout=subprocess.PIPE, shell=True)

backoffice_tests = subprocess.Popen('start npm test', cwd=backoffice_filepath, stdout=subprocess.PIPE, shell=True)

while backoffice_tests.returncode == None:
    time.sleep(2)
    backoffice_tests.terminate()
    backoffice_tests.wait()


while api_server.returncode == None or backoffice_service.returncode == None:
    
    time.sleep(2)
    
    backoffice_service.kill()
    api_server.kill()
    

subprocess.Popen('start docker exec -i postgres_container /bin/bash -c "psql -U postgres -f /backup/tfg-db.sql"', stdout=subprocess.PIPE, shell=True)    
