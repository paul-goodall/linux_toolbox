# -------------------------- 
FROM hercules123/goodsy_r_shiny_plus2
MAINTAINER Paul Goodall "paul.thomas.goodall@gmail.com"

RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
  build-essential \
  libpng-dev \
  zlib1g-dev \
  libjpeg-dev \
  ghostscript-x \
  imagemagick \
  gle-graphics
  
RUN su - -c "R -e \"install.packages(c('shinydashboard'), repos='http://cran.rstudio.com/')\""  

COPY setup_docs/shiny-server.conf /etc/shiny-server/.

RUN git clone https://github.com/paul-goodall/linux_toolbox.git
RUN ln -s /srv/shiny-server/super_dash /home/rstudio/linux_toolbox/super_dash
RUN ln -s /srv/shiny-server/examples /home/rstudio/shiny_examples
RUN chmod -R 777 /srv/shiny-server/*

RUN export ADD=shiny && bash /etc/cont-init.d/add

# Expose the ports we need to get started:
EXPOSE 8787 3838

