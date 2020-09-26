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
  ffmpeg \
  gle-graphics
  
RUN su - -c "R -e \"install.packages(c('shinydashboard'), repos='http://cran.rstudio.com/')\""  

COPY setup_docs/shiny-server.conf /etc/shiny-server/.

RUN wget https://raw.githubusercontent.com/paul-goodall/linux_toolbox/master/setup_docs/start_up_commands.sh -O /home/rstudio/start_up_commands.sh
RUN chmod 777 /home/rstudio/start_up_commands.sh

RUN export ADD=shiny && bash /etc/cont-init.d/add

# Expose the ports we need to get started:
EXPOSE 8787 3838

CMD ["/home/rstudio/start_up_commands.sh"]

