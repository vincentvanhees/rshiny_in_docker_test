# rshiny_in_docker_test
Repository to test using Rshiny in Docker with mounted volume


### To reproduce the issue:

1. Install Docker
2. cd to the Docker folder of this repo.
3. `docker build -t habitus-app .`
4. `docker run --rm -v ~:/srv/shiny-server/data -p 3838:3838 habitus-app`. Where you may want to replace `~` by the path of the local directory you want to mount.
5. Click the button.