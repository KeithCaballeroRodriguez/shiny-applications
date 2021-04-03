library(shiny)


# Uso de clases de boostrap para crear cards, aunque no muestra bien ---
# Es por eso que se necesita las dependencias

my_card <- function(...) {
  withTags(
    div(
      class = "card border-success mb-3",
      div(class = "card-header bg-transparent border-success"),
      div(
        class = "card-body text-success",
        h3(class = "card-title", "title"),
        p(class = "card-text", ...)
      ),
      div(
        class = "card-footer bg-transparent border-success", 
        "footer"
      )
    )
  )
}

# we build our app
shinyApp(
  ui = fluidPage(
    fluidRow(
      column(
        width = 12,
        align = "center",
        br(),
        my_card("Card Content")
      )
    )
  ),
  server = function(input, output) {}
)



# Agregando la dependencia de boostrap ------------------------------------

bs4_cdn <- "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/"
bs4_css <- paste0(bs4_cdn, "css/bootstrap.min.css")



shinyApp(
  ui = fluidPage(
    # load the css code
    tags$head(
      tags$link(
        rel = "stylesheet", 
        type = "text/css", 
        href = bs4_css)
    ),
    fluidRow(
      column(
        width = 12,
        align = "center",
        br(),
        my_card("Card Content")
      )
    )
  ),
  server = function(input, output) {}
)


# La mejor practica para insertar dependencias ----------------------------

card_css <- "css/bootstrap.min.css"
bs4_card_dep <- function() {
  htmlDependency(
    name = "bs4_card",
    version = "1.0",
    src = c(href = bs4_cdn),
    stylesheet = card_css
  )
}


my_card <- function(...) {
  cardTag <- withTags(
    div(
      class = "card border-success mb-3",
      div(class = "card-header bg-transparent border-success"),
      div(
        class = "card-body text-success",
        h3(class = "card-title", "title"),
        p(class = "card-text", ...)
      ),
      div(
        class = "card-footer bg-transparent border-success", 
        "footer"
      )
    )
  )
  
  # attach dependencies (old way)
  # htmltools::attachDependencies(cardTag, bs4_card_dep())
  
  # simpler way
  tagList(cardTag, bs4_card_dep())
  
}


ui <- fluidPage(
  title = "Hello Shiny!",
  fluidRow(
    column(
      width = 12,
      align = "center",
      br(),
      my_card("Card Content")
    )
  )
)

shinyApp(ui, server = function(input, output) { })
