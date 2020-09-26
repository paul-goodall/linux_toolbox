## app.R ##

# ====================================================
# Use the latest code from the repo
my_base_path <-"https://raw.githubusercontent.com/paul-goodall/linux_toolbox/master/super_dash/"
my_css <- "https://raw.githubusercontent.com/paul-goodall/linux_toolbox/master/super_dash/www/styles.css"
if(as.character(Sys.info()["nodename"]) %like% "GoldEgwene"){
    my_base_path <- ""
    my_css <- "styles.css"
}
sauce <- function(my_file, base_path=my_base_path){
    source(paste0(base_path, my_file), local=TRUE)$value
}
# ====================================================


sauce("app_content.R")
