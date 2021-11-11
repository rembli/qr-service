# Simple QR Service

## prepare env 
pipenv install 
pipenv shell
pip freeze > requirements.txt

## run 
./run.sh

## build local docker image
docker build -t rembli/qr-service .
docker push rembli/qr-service
docker run --name qr-service -dp 5000:5000 rembli/qr-service 

# deploy to azure
./azure-setup.sh
./azure-up.sh

