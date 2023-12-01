library(dplyr) # part of tidyverse
library(AMR) # this package
library(readr)
library(xlsx)
library(readxl)

setwd("D:/ALLYSA FILE/2023/DMU Files/DMU Projects/Data Summary Report")

df <- read.csv("Excel/RAW_W0323PHL_VSM_2023.csv")

data <- df %>%
  # get microbial ID based on given organism
  mutate(mo = as.mo(ORGANISM)) %>%
  # transform everything to the new `sir` class
  mutate(across(AMK_ND30:AMX_ND30, as.disk)) %>%
  mutate(across(AMK_NM:AMX_NE, as.mic)) %>%
  mutate_at(vars(AMK_ND30:AMX_NE), as.sir)


write.csv(data, file="Excel/data_ris.csv")

