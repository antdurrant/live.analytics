## code to prepare `pos_ref` dataset goes here

# pos ####
pos_ref <- tibble::tribble(
  ~upos,                 ~pos,
  "ADJ",          "adjective",
  "ADV",             "adverb",
  "INTJ",       "interjection",
  "NOUN",               "noun",
  "PROPN",        "proper-noun",
  "VERB",               "verb",
  "ADP",        "preposition",
  "AUX",          "auxiliary",
  "CCONJ",  "coord-conjunction",
  "DET",         "determiner",
  "NUM",             "number",
  "PART",           "particle",
  "PRON",            "pronoun",
  "SCONJ", "subord-conjunction"
)

usethis::use_data(pos_ref, overwrite = TRUE)
