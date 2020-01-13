## Data preparation

exData <- readRDS("data-raw/exData-sm2.rds")
usethis::use_data(exData, overwrite = TRUE)

GSE9750 <- readRDS("data-raw/GSE9750-sm2.rds")
usethis::use_data(GSE9750, overwrite = TRUE)
