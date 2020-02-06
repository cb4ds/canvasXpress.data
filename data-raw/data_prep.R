## Data preparation
require('dplyr')
require('tidyr')
require('tibble')
require('usethis')


exData <- readRDS("data-raw/exData-sm2.rds")
usethis::use_data(exData, overwrite = TRUE)


# GSE9750 preparation from source

y <- readr::read_delim('data-raw/GSE9750_series_matrix.txt.gz', '\t', skip = 73, n_max = 22283) %>% as.data.frame()
rownames(y) <- y$ID_REF; y$ID_REF <- NULL

z <- readr::read_delim('data-raw/GPL96.annot.gz', '\t', skip = 27) %>%
    rename(vars        = ID,
           Description = `Gene title`,
           Locus       = `Chromosome location`,
           Symbol      = `Gene symbol`) %>%
    select(vars, Description, Locus, Symbol) %>%
    as.data.frame()
rownames(z) <- z$vars


x <- readr::read_delim('data-raw/GSE9750_series_matrix.txt.gz', '\t', skip = 33, n_max = 37) %>%
    t() %>% as.data.frame(stringsAsFactors = F)
colnames(x) <- gsub('!', '', x[1, ]); x <- x[-1, ]

x <- x %>%
    select(Sample_geo_accession, Sample_characteristics_ch1, Sample_description) %>%
    extract(Sample_characteristics_ch1, "Age", "[A|a]ge +([0-9]+)", remove = F) %>%
    extract(Sample_characteristics_ch1, "Stage", "[S|s]tage +([A-Z,0-9]+),", remove = F) %>%
    extract(Sample_characteristics_ch1, "HPV", "(HPV +.*$)", remove = F) %>%
    mutate(HPV = gsub("HPV", "", HPV),
           Sample_Type = case_when(grepl("cell line", ignore.case = T, Sample_description) ~ "cell line",
                                   grepl("dissect", ignore.case = T, Sample_description) ~ "microdissection",
                                   TRUE ~ "tissue specimen"),
           Sample_Type = ifelse(grepl('dissect', ignore.case = T, Sample_characteristics_ch1), 'microdissection', Sample_Type),
           Cell_Type = case_when(grepl('squamous', ignore.case = T, Sample_characteristics_ch1) ~ 'squamous cell carcinoma', 
                                 grepl('adenocarcinoma', ignore.case = T, Sample_characteristics_ch1) ~ 'adenocarcinoma',
                                 grepl('normal', ignore.case = T, Sample_characteristics_ch1) ~ 'normal')) %>%
    select(Sample_geo_accession, Sample_Type, Cell_Type, Stage, Age, HPV) %>%
    as.data.frame()
rownames(x) <- x$Sample_geo_accession; x$Sample_geo_accession <- NULL


GSE9750 <- list(x = x, y = y, z = z)           
usethis::use_data(GSE9750, overwrite = TRUE)
