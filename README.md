# rshiny_in_docker_test
Repository to test using Rshiny in Docker with mounted volume

This repository acts as a test environment for creating a Docker container with a shiny app inside it that is able to write to a mounted volume. The app is consists of only a button, which ones clicked tells the apps to save a tiny text file to the mounted volume. When run outside a Docker container the app works fine, but when run inside the Docker container the app currently crashes once the button is clicked.


### To reproduce the issue:

1. Install Docker
2. Clone this repository.
3. cd to the Docker folder of this repo.
4. Build: `docker build -t habitus-app .`
5. Run: `docker run --rm -v ~:/srv/shiny-server/data -p 3838:3838 -u shiny habitus-app`. Where you may want to replace `~` by the path of the local directory you want to mount.
6. Open app in browser: http://localhost:3838/
7. Click the button.