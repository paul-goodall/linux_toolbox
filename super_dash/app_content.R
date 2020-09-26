library(shinydashboard)

ui <- dashboardPage(
  
  dashboardHeader(title = "Goodsy Super-dash"),
  
  
  ## Sidebar content
  dashboardSidebar(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = my_css)
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
      tabItem(tabName = "my_apps",     sauce("tabs/my_apps.R")),
      tabItem(tabName = "gle",         sauce("tabs/gle.R")),
      tabItem(tabName = "imagemagick", sauce("tabs/imagemagick.R")),
      tabItem(tabName = "ffmpeg",      sauce("tabs/ffmpeg.R")),
      tabItem(tabName = "linux_tools", sauce("tabs/linux_tools.R"))
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
