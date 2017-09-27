# vagrant-nginx
USAGE:

Commands should be executed inside docker directory

cd docker

Start environment:

docker-compose up -d

Login in a container:

docker-compose exec <service> bash

Container logs:

docker-compose logs -f -t <service>
