#' word_list UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_word_list_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' word_list Server Function
#'
#' @noRd 
mod_word_list_server <- function(input, output, session){
  ns <- session$ns
 
}
    
## To be copied in the UI
# mod_word_list_ui("word_list_ui_1")
    
## To be copied in the server
# callModule(mod_word_list_server, "word_list_ui_1")
 
