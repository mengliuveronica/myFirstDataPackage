## code to prepare `DATASET` dataset goes here

usethis::use_data(DATASET, overwrite = TRUE)

library(gutenbergr)
pacman::p_load(tidyverse,rio)

id <- gutenberg_metadata %>% 
      filter(str_detect(title,"The Moon and Sixpence|The Age of Innocence|The Cask"), 
             has_text==T) %>% 
      pull(gutenberg_id)

books <- gutenberg_download(id,
         meta_fields = c("title"))

usethis::use_data(books,overwrite=T)

