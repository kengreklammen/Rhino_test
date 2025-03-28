box::use(
  # External packages
  shiny[fluidPage, textInput, reactive, moduleServer],
  
  # Own modules
  app/view/greeting_module
)

#' @export
ui <- function(id) {
  ns <- shiny::NS(id)
  fluidPage(
    textInput("nameInput", "Your name:"),
    greeting_module$ui(ns("greet")) # Pass a namespace
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    name <- reactive({input$nameInput})
    greeting_module$server("greet", name) # Uses the exported server
  })
}