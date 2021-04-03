ui <- fluidPage(
  tags$style(
    "p, div { 
      color: red;
    }"
  ),
  p("Hello World"),
  div("A block")
)

server <- function(input, output) {}

shinyApp(ui, server)


ui <- fluidPage(
  tags$style(
    ".first-p { 
      color: red;
    }
    #element {
      color: red;
    }
    "
  ),
  p(class = "first-p", "Hello World"),
  p("Another text"),
  div(id = "element", "A block")
)

server <- function(input, output) {}

shinyApp(ui, server)


# Agregamos un poco de estilo a los navs ----------------------------------


ui <- navbarPage(
  "App Title",
  tabPanel(
    "Plot",
    tags$style(
      "li a {
        font-size: 20px;
        font-weight: bold;
      }
    "
    ),
    tabsetPanel(
      tabPanel("Plot"),
      tabPanel("Summary"),
      tabPanel("Table")
    )
  ),
  tabPanel("Summary"),
  tabPanel("Table")
)

server <- function(input, output) {}

shinyApp(ui, server)


# Cambiamos el selector ya que los tabs inferiores se vieron afect --------

ui <- navbarPage(
  "App Title",
  tabPanel(
    "Plot",
    tags$style(
      ".navbar-nav li a {
        font-size: 20px;
        font-weight: bold;
      }
    "
    ),
    tabsetPanel(
      tabPanel("Plot"),
      tabPanel("Summary"),
      tabPanel("Table")
    )
  ),
  tabPanel("Summary"),
  tabPanel("Table")
)

server <- function(input, output) {}

shinyApp(ui, server)



# Probamos ----------------------------------------------------------------

ui <- navbarPage(
  "App Title",
  tabPanel(
    "Plot",
    tags$style(
      HTML(
        ".navbar-nav > li > a {
          font-size: 20px;
          font-weight: bold;
        }
        "
      )
    )
  ),
  navbarMenu(
    "More",
    tabPanel("Summary"),
    "----",
    "Section header",
    tabPanel("Table")
  )
)

server <- function(input, output) {}

shinyApp(ui, server)



# Somos más especificos y usamos pseudo clases ----------------------------

ui <- navbarPage(
  "App Title",
  tabPanel(
    "Plot",
    tags$style(
      HTML(
        ".navbar-nav > li:first-child > a {
          font-size: 20px;
          font-weight: bold;
        }
        "
      )
    )
  ),
  navbarMenu(
    "More",
    tabPanel("Summary"),
    "----",
    "Section header",
    tabPanel("Table")
  )
)

server <- function(input, output) {}

shinyApp(ui, server)


# O inseratmos pseudo elementos -------------------------------------------


ui <- navbarPage(
  "App Title",
  tabPanel(
    "Plot",
    tags$style(
      HTML(
        ".navbar-nav > li:first-child > a {
            font-size: 20px;
            font-weight: bold;
          } 
          .navbar-nav > li:first-child > a::before {
            content: '✌️'
          }
        "
      )
    )
  ),
  navbarMenu(
    "More",
    tabPanel("Summary"),
    "----",
    "Section header",
    tabPanel("Table")
  )
)

server <- function(input, output) {}

shinyApp(ui, server)




ui <- fluidPage(
  tags$style(
    ".smaller--h1 {
      font-size: 0.75em;
    }
    .smaller--p {
      font-size: 80%;
    }
    "
  ),
  h1("Default <h1>"),
  h1(class = "smaller--h1", "Smaller <h1>"),
  p("Normal <p>"),
  p(class = "smaller--p", "Smaller <p>")
)

server <- function(input, output) {}

shinyApp(ui, server)



library(OSUICode)
library(shinyWidgets)
ui <- fluidPage(
  useShinydashboard(),
  br(),
  box2(
    title = "Box with border", 
    background = "blue", 
    height = "400px"
  )
)

server <- function(input, output) {}

shinyApp(ui, server)


ui <- fluidPage(
  useShinydashboard(),
  tags$style(
    ".box {
      border-top: none;
      border-radius: 10px;
      border-left: 6px solid #e28810;
      box-shadow: 0 1px 1px rgb(0 0 0 / 10%);
    }
    .box:hover {
      box-shadow: 0px 8px 8px 0px rgb(0, 0, 0, 0.2);
    }
    .box-header {
      color: #fff;
    }
    "
  ),
  br(),
  box2(
    title = "Box with border", 
    background = "blue", 
    height = "400px"
  )
)

server <- function(input, output) {}

shinyApp(ui, server)


ui <- fluidPage(
  tags$style(
    ".block {
      border-color: #00000;
      border-style: solid;
      background-color: lightblue;
      text-align: center;
      margin: 10px;
      min-height: 200px;
      width: 200px;
    }
    
    span, a {
      background-color: orange;
    }
    "
  ),
  div(
    class = "block",
    "Block 1",
    br(),
    span("Inline text 1"), span("Inline text 2")
  ),
  div(
    class = "block",
    "Block 2",
    br(),
    lapply(1:2, a, href = "https://www.google.com/", "Link")
  ),
  div(
    class = "block",
    "Block 3",
    lapply(1:5, span, "Inline text")
  )
)

server <- function(input, output) {}

shinyApp(ui, server)


ui <- fluidPage(
  tags$style(
    ".container {
      display: flex;
      flex-direction: row-reverse;
      border: red dashed 2px;
    }
    
    p {
      width: 200px;
      height: 200px;
      text-align: center;
      color: white;
      font-size: 50px;
    }
    
    .container  :nth-child(1) {
      background-color: green;
    }
    .container  :nth-child(2) {
      background-color: orange;
    }
    .container  :nth-child(3) {
      background-color: purple;
    }
    "
  ),
  div(
    class = "container",
    p("A"),
    p("B"),
    p("C")
  )
)

server <- function(input, output) {}

shinyApp(ui, server)


ui <- fluidPage(
  tags$style(
    "@media all and (max-device-width: 480px) {
      p {
        font-size: 1.5em;
      }
    }
    "
  ),
  p("Hello World")
)

server <- function(input, output) {}
shinyApp(ui, server)




shinyApp(
  ui = fluidPage(
    actionButton("show", "Show modal dialog")
  ),
  server = function(input, output) {
    observeEvent(input$show, {
      showModal(
        modalDialog(
          title = "Important message",
          "This is an important message!"
        )
      )
    })
  }
)
