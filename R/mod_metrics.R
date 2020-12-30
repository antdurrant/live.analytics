#' metrics UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_metrics_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' metrics Server Function
#'
#' @noRd 
mod_metrics_server <- function(input, output, session){
  ns <- session$ns
 
}
    
## To be copied in the UI
# mod_metrics_ui("metrics_ui_1")
    
## To be copied in the server
# callModule(mod_metrics_server, "metrics_ui_1")
 
