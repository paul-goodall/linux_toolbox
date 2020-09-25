## app.R ##
library(shinydashboard)

ui <- dashboardPage(
    
    dashboardHeader(title = "Goodsy Super-dash"),
    
    
    ## Sidebar content
    dashboardSidebar(
        tags$head(
            tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
        ),
        sidebarMenu(
            menuItem("My Apps",     tabName = "my_apps",     icon = icon("app-store")),
            menuItem("GLE",         tabName = "gle",         icon = icon("paint-brush")),
            menuItem("ImageMagick", tabName = "imagemagick", icon = icon("hat-wizard")),
            menuItem("FFMPEG",      tabName = "ffmpeg",      icon = icon("file-video")),
            menuItem("Linux Tools", tabName = "linux_tools", icon = icon("linux"))
        )
    ),
    ## Body content
    dashboardBody(
        tabItems(
            tabItem(tabName = "my_apps",     source("tabs/my_apps.R",     local=TRUE)$value),
            tabItem(tabName = "gle",         source("tabs/gle.R",         local=TRUE)$value),
            tabItem(tabName = "imagemagick", source("tabs/imagemagick.R", local=TRUE)$value),
            tabItem(tabName = "ffmpeg",      source("tabs/ffmpeg.R",      local=TRUE)$value),
            tabItem(tabName = "linux_tools", source("tabs/linux_tools.R", local=TRUE)$value)
        )
    )
)

server <- function(input, output) {
    set.seed(122)
    histdata <- rnorm(500)
    
    output$plot1 <- renderPlot({
        data <- histdata[seq_len(input$slider)]
        hist(data)
    })
}

shinyApp(ui, server)
