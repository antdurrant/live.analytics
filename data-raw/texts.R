## code to prepare `texts` dataset goes here

library(tidyverse)
library(udpipe)
library(janeaustenr)
library(gutenbergr)


austen_piped <- austen_books() %>%
  group_by(book) %>%
  summarise(text = paste(text, collapse = " ")) %>%
  ungroup() %>%
  rename(doc_id = book) %>%
  udpipe(object = "english", parallel.cores = 4)

usethis::use_data(texts, overwrite = TRUE)


fairy_tales <- gutenberg_subjects %>% filter(subject == "Fairy tales") %>% 
  sample_n(10) %>% pull(gutenberg_id) %>% gutenberg_download()

sf_dl <- safely(gutenberg_download)


railway_children <- gutenberg_download(1874) 

young_family_literature <- gutenberg_subjects %>%
  filter(str_detect(subject, "Brothers .+ Juvenile")) %>%
  sample_n(10) %>% 
  pull(gutenberg_id) %>%
  sf_dl()

young_family_lit <- 
  tibble(gutenberg_id = young_family_literature$result$gutenberg_id, 
         text = young_family_literature$result$text) %>% 
  bind_rows(railway_children) %>% 
  group_by(gutenberg_id) %>%
  summarise(text = paste(text, collapse = " ")) %>% 
  rename(doc_id = gutenberg_id) %>%
  udpipe(object = "english", parallel.cores = 4)



