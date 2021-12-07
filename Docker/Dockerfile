# get shiny server and R from the rocker project
FROM rocker/shiny

# install R packages required
RUN R -e 'install.packages(c("shiny", "remotes"), \
            repos="https://packagemanager.rstudio.com/cran/__linux__/focal/latest"\
          )'
RUN R -e 'remotes::install_github("vincentvanhees/rshiny_in_docker_test")'

RUN mkdir -p /code

COPY /code/app.R /srv/shiny-server/

# run app
WORKDIR /srv/shiny-server/data
CMD ["/usr/bin/shiny-server"]
