
# Estrucutra de shinydashboard --------------------------------------------

library(shinydashboard)
shinyApp(
  ui = dashboardPage(
    dashboardHeader(),
    dashboardSidebar(),
    dashboardBody(),
    title = "Dashboard example"
  ),
  server = function(input, output) { }
)


# Copiamos las dependencias de shinydashboard para usarlas en shiny -------

library(htmltools)
deps <- findDependencies(
  dashboardPage(
    header = dashboardHeader(), 
    sidebar = dashboardSidebar(), 
    body = dashboardBody()
  )
)
deps[[1]]

# Con dependencias
my_box <- function(title, status) {
  tagList(box(title = title, status = status), deps)
}
# Sin dependencias
my_box <- function(title, status) {
  tagList(box(title = title, status = status))
}

ui <- fluidPage(
  tags$style("body { background-color: gainsboro; }"),
  titlePanel("Shiny with a box"),
  my_box(title = "My box", status = "danger"),
)
server <- function(input, output) {}
shinyApp(ui, server)
