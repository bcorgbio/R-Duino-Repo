library(tidyverse)
library(Momocs)

f <- list.files("class_out_data",pattern=".txt|.csv",full.names = TRUE)


out <- read_delim(f[1],delim="\t") %>% 
  as.matrix()

out %>% 
  list() %>% 
  Out() %>% 
  coo_flipx() %>% 
  stack()