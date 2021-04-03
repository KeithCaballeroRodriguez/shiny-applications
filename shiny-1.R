library(shiny)


ui <- fluidPage(p("Hello World"))

server <- function(input, output, session) {}

shinyApp(ui, server)
