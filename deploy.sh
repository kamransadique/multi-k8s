# build images
docker build -t kamransadique/multi-client:latest -t kamransadique/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t kamransadique/multi-server:latest -t kamransadique/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t kamransadique/multi-worker:latest -t kamransadique/multi-worker:$SHA -f ./worker/Dockerfile ./worker
# push to docker
docker push kamransadique/multi-client:latest
docker push kamransadique/multi-server:latest
docker push kamransadique/multi-worker:latest
docker push kamransadique/multi-client:$SHA
docker push kamransadique/multi-server:$SHA
docker push kamransadique/multi-worker:$SHA

# apply k8s config file
kubectl apply -f k8s

# set images to deploy
kubectl set image deployments/client-deployment client=kamransadique/multi-client:$SHA
kubectl set image deployments/server-deployment server=kamransadique/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=kamransadique/multi-worker:$SHA
