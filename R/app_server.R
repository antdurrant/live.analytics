#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  word_list <- reactive({
    make_list(piped = input$text)
  })
  
  
  output$table_word_list <- renderDataTable(
    word_list
  )
  
  
}
