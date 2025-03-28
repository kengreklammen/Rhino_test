box::use(
  # External packages
  shiny[moduleServer, NS, textOutput, renderText],
  
  # Own modules
  app/logic/my_functions
)

#' @export
ui <- function(id){
  ns <- NS(id)
  textOutput(ns("greeting"))
}

#' @export
server <- function(id, name) {
  moduleServer(id, function(input, output, session) {
    output$greeting <- renderText({
      my_functions$greet_user(name())
      })
    })
  }