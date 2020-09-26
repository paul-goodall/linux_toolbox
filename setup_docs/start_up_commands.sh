cd /home/rstudio
git clone https://github.com/paul-goodall/linux_toolbox.git
sudo ln -s /home/rstudio/linux_toolbox/super_dash /srv/shiny-server/super_dash
ln -s /srv/shiny-server/examples /home/rstudio/shiny_examples
chmod -R 777 /srv/shiny-server/*

