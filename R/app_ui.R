#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
    # List the first level UI elements here 
    fluidPage(
      h1("live.analytics"),
      textAreaInput(inputId = "text", 
                    label = "Paste your text here for processing.", 
                    width = "90%",
                    height = "10%"
                    ), # close textAreaInput
      sidebarLayout(
        sidebarPanel(width = 3,
                     selectInput(inputId = "list_select",
                     label = "Select your reference list:",
                     choices = c("list_ngsl", 
                                 "list_academic",
                                 "list_business", 
                                 "list_dolch", 
                                 "list_flemma", 
                                 "list_ngsl_all", 
                                 "list_toeic",
                                 "list_wiki"), # close c
                     selected = "list_general_plus"), # close selectInput
        ), # close sidebarPanel
        mainPanel(dataTableOutput("table_word_list")
      ) # close mainPanel
    ) # close sidebarLayout
  ) # close fluidPage
}



