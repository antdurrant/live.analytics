#' Get analytics on udpiped object
#' 
#' Metrics are divided into features (feat) and subfeatures (sub_feat).
#'POS features give a sheer percentage as their rate. 
#' Other features give a count/100 words rate.
#' These metrics are purely descriptive and provide a reference to check against 
#' other relevant materials.
#' With time, the intention is to build out a proper database of reference materials.
#' 
#' 
#'
#' @param piped a dataframe produced by udpipe::udpipe AKA "piped text"
#'
#' @return a dataframe containing assorted analytics 
#' @export
#'
#' @examples

# analytics(piped = udpipe::udpipe("Jeff was shot thirty-five times." , object = "./data/english-ewt-ud-2.5-191206.udpipe"))

analytics <- function(piped){

  
  
  pos <- piped %>% 
    dplyr::filter(!.data$upos %in% c("PUNCT", "SYM", "X")) %>%
    dplyr::left_join(pos_ref) %>%
    dplyr::mutate(feat = "pos") %>%
    dplyr::rename(sub_feat = .data$pos) %>%
    dplyr::group_by(.data$feat, .data$sub_feat) %>%
    dplyr::summarise(count = dplyr:: n())
  
  wcount <- sum(pos$count)
  
  pos <- pos %>%
    dplyr::mutate(rate = .data$count/wcount)
  
  # features ####
  
  feat <- function(data = piped, feature){
    data %>% 
      dplyr::filter(stringr::str_detect(.data$feats, feature)) %>%
      dplyr::mutate(sub_feat = stringr::str_extract(.data$feats, glue::glue("(?<={feature}\\=)[A-Za-z]+"))                    ,
                    feat = stringr::str_to_lower(feature)) %>% 
      dplyr::group_by(.data$feat, .data$sub_feat) %>%
      dplyr::summarise(count = dplyr::n())
  }
    
  tense <- feat(piped, feature = "Tense")
  # tense <- piped %>% 
  #   dplyr::filter(stringr::str_detect(.data$feats, "Tense")) %>%
  #   dplyr::mutate(.data$sub_feat = stringr::str_extract(.data$feats, "(?<=Tense\\=)[A-Za-z]+"),
  #                 .data$feat = "tense") %>% 
  #   dplyr::group_by(.data$feat, tense) %>%
  #   dplyr::summarise(.data$count = dplyr::n())
  passive <- feat(piped, feature = "Voice")
  # passive <- piped %>% 
  #   dplyr::filter(stringr::str_detect(.data$feats, "Voice")) %>%
  #   dplyr::mutate(.data$subfeat = str_extract(.data$feats, "(?<=Voice\\=)[A-Za-z]+"),
  #                 .data$feat = "voice") %>% 
  #   dplyr::group_by(.data$feat, subfeat) %>%
  #   dplyr::summarise(count = dplyr::n())

  
  bind_rows(tense, passive, pos)
  
  
  
}
