## Data preparation
require('dplyr')
require('tidyr')
require('tibble')
require('usethis')
require('readr')
require('GEOquery')

# Get original data for GSE9750
orig.file <- tempfile("data", fileext = ".txt.gz")
download.file('ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE9nnn/GSE9750/matrix/GSE9750_series_matrix.txt.gz', 
              orig.file, mode = 'wb')


y <- read_delim(orig.file, '\t', skip = 73, n_max = 22283) %>% as.data.frame()
rownames(y) <- y$ID_REF
y$ID_REF <- NULL

z <- getGEO("GPL96", destdir = tempdir())
z <- z@dataTable@table %>%
    rename(vars        = ID,
           Description = `Gene Title`,
           Symbol      = `Gene Symbol`) %>%
    select(vars, Description, Symbol) %>%
    as.data.frame()
rownames(z) <- z$vars


x <- read_delim(orig.file, '\t', skip = 33, n_max = 37) %>%
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


GSE9750_cleaned <- list(x = x, y = y, z = z)           
use_data(GSE9750_cleaned, overwrite = TRUE)

GSE9750_original <- read_lines(orig.file)
use_data(GSE9750_original, overwrite = TRUE)

