# rshiny_in_docker_test
Repository to test using Rshiny in Docker with mounted volume

This repository aims to test the creation of a Docker container that has a Shiny app inside it that is able to write to a mounted volume. The app consists of only one button which, once clicked, tells the app to save a tiny text file to the mounted volume. 


### Installation

1. Install Docker
2. Clone this repository.
3. cd to the Docker folder of this repo.
4. `docker build -t test-app .` If you already have a rocker/shiny image then this should take less than a minute.

### Run

5. `docker run --rm -it -v ~/:/srv/shiny-server/data/ -p 3838:3838 -u shiny test-app`
6. Open app in browser: http://localhost:3838/

### Run in detached mode to check log file

7. `docker run --rm -d -v ~/:/srv/shiny-server/data/ -p 3838:3838 --name my-test-run test-app`
8. `docker exec -it my-test-run bash`
9. Open app in browser: http://localhost:3838/
10. `cd /var/log/shiny-server` # Is shiny-server-shiny-*.log there? If yes, look inside/
11. When done, to remove all containers: `docker container kill $(docker container ls -q)`

