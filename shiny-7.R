library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
shinyApp(
  ui = dashboardPage(
    options = list(sidebarExpandOnHover = TRUE),
    header = dashboardHeader(),
    sidebar = dashboardSidebar(minified = TRUE, collapsed = TRUE),
    body = dashboardBody(
      lapply(1:20, box, width = 12, title = "box")
    ),
    controlbar = dashboardControlbar(),
    title = "DashboardPage"
  ),
  server = function(input, output) { }
)





library(shiny)
ui <- fluidPage()
server <- function(input, output, session) {}
shinyApp(ui, server)


#https://deanattali.com/2015/05/09/setup-rstudio-shiny-server-digital-ocean/
