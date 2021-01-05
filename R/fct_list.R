#' Create Word Lists from Piped Text
#'
#' @param piped dataframe piped from udpipe::udpipe
#' @param word_list word list to use as basis for joining
#'
#' @return a dataframe of words and groups
#' @export
#' 
make_list <- function(piped, word_list = c(list_academic, 
                                     list_business,
                                     list_dolch, 
                                     list_general_plus,
                                     list_ngsl,
                                     list_ngsl_all,
                                     list_wiki, 
                                     list_toeic,
                                     list_kids,
                                     list_flemma)){
  
  
  piped %>% 
    dplyr::filter(!upos %in% c("PUNCT", "SYM", "X")) %>%
    dplyr::left_join(word_list) %>%
    dplyr::mutate(group = dplyr::case_when(is.na(group) & upos == "PROPN" ~ "PROPN",
                             is.na(group) ~ "OFF",
                             TRUE ~ as.character(group)
                             )
    ) %>% 
    dplyr::select(token, lemma, group, on_list,)
  
} 
