# Image build
docker image build -t reysonbarros/giropops-senhas-distroless:1.0 .

# Run redis container
docker container run --name redis-server -d -p 6379:6379 redis

# Run main application container
docker container run --name giropops-senhas-distroless -d -p 5000:5000 -e REDIS_HOST=192.168.1.6 reysonbarros/giropops-senhas-distroless:1.0

# Login Dockerhub
docker login

# Push image to Dockerhub
docker push reysonbarros/giropops-senhas-distroless:1.0

