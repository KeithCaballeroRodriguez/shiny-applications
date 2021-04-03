library(htmltools)
tag <- div("Hello World")
tag



tag("test",list(p("Custom Tag")))

customTag <- tag(
  "test", 
  list(class = "test", p("Custom Tag"))
)
str(customTag)


HTML("<div>Blabla</div>")

div("Blabla")

class(HTML("<div>Blabla</div>"))

class(div("Blabla"))


#https://alandipert.shinyapps.io/html2r/

myTag <- div(
  class = "divclass", 
  id = "first",
  h1("My first child!"),
  span(class = "child", id = "baby", "Crying")
)
myTag


# Acceder al nombre del tag
myTag$name
# Acceder a los atributos (id and class)
myTag$attribs
# Accede al hijo (returns a list of 2 elements)
myTag$children
# Accede a la estrucuta
str(myTag)

second_children <- myTag$children[[2]]
second_children$attribs$class <- "adult"

# no ha cambiado la clase del segundo hijo
second_children
myTag 

# se tiene que hacer directamente al tag
myTag$children[[2]]$attribs$class <- "adult"
myTag


(myTag <- div("A tag"))
(myTag <- tagAppendAttributes(myTag, id = "myid"))

(myTag <- tagAppendAttributes(
  myTag, 
  `data-toggle` = "tabs", 
  class = "myclass"
))


myTag$attribs[["data-toggle"]] <- "newValue"
myTag$attribs$class <- "newClass"

myTag


library(shiny)

ui <- fluidPage(
  myTag <- div("A tag"),
  myTag <- tagAppendAttributes(myTag, id = "myid"),
  
  myTag <- tagAppendAttributes(
    myTag, 
    `data-toggle` = "tabs", 
    class = "myclass"
  ),
)

server <- function(input, output, session) {}

shinyApp(ui, server)




# Funciones de htmltools para tags ----------------------------------------

myTag <- div(class = "myclass")
tagHasAttribute(myTag, "class")

library(dplyr)

myTag %>% tagHasAttribute("class")

myTag %>% tagGetAttribute("class")

myTag %>% tagGetAttribute("id")


# Como establecer un hijo dentro de un bloque (Set) | Elimina todo --------

(myTag <- div(
  class = "parent", 
  id = "father", 
  "Father!",
  span("Hijito")
))

child <- span("Hija")

(myTag <- myTag %>% tagSetChildren(child))


# Como Agregar(Append) hijos al bloque ------------------------------------

(myTag <- div(class = "Padre", "Un tag", "Hijo 1",span("Hijo 2")))

otherTag <- span("Hijo 3")
(myTag <- myTag %>% tagAppendChild(otherTag))



# Como eliminar Hijos dentro del Bloque -----------------------------------

(myTag <- div(class = "Papi", span("Olu"),span("Oli"),span("Soli")))

tagRemoveChild <- function(tag, n) {
  # check if the list is empty
  if (length(tag$children) == 0) {
    stop(paste(tag$name, "does not have any children!"))
  }
  tag$children[n] <- NULL
  tag
}
(tagRemoveChild(myTag, 1))
(tagRemoveChild(myTag, 3))


# Agregar hijos en lugares especificos no como Append ---------------------

tagInsertChild <- function(tag, child, position) {
  tag$children <- append(tag$children, list(child), position - 1)
  tag
}

(tagInsertChild(p(span("hello")), a(), 1))
(tagInsertChild(p(span("hello")), a(), 2))


