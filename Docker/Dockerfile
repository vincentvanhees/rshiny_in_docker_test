# get shiny server and R from the rocker project
FROM rocker/shiny

SHELL ["/bin/bash",  "--login", "-c"]

# install R packages required
RUN R -e 'install.packages("remotes", \
            repos="https://packagemanager.rstudio.com/cran/__linux__/focal/latest"\
          )'
RUN R -e 'remotes::install_github("vincentvanhees/rshiny_in_docker_test")'

# Copy code to run the app to the container
RUN mkdir -p /code
COPY /code/app.R /srv/shiny-server/

# Change working directory to equal the location of the mounted volume
WORKDIR /srv/shiny-server/data

# run app
CMD ["/usr/bin/shiny-server"]
