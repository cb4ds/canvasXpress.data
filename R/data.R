#' canvasXpress datasets
#'
#' This package contains data used and referenced in the canvasXpress R package
#'
#' @docType package
#' @name canvasXpress.data
#' @aliases canvasXpress.data canvasXpress.data-package
NULL

#' Gene Expression Dataset - Cervical Cancer (cleaned)
#' 
#' @description This example dataset is taken from the below referenced study.  That study was aimed 
#' at identification of gene expression profiles in cervical cancer and the role of specific genes
#' in cervical carcinogenesis.  The data was prepared for visualization by splitting the file into metadata (header)
#' information and gene expression values.  The data was cleaned - sample characteristics were divided to clean up the
#' metadata, missing values were encoded as NA, etc.  Gene information was brought in using the GEOquery package 
#' as a third dataframe to provide metadata on genes to allow data users to reference genes by Symbol, etc.
#' 
#' @references Scotto L, Narayan G, Nandula SV, Arias-Pulido H et al. Identification of copy number 
#' gain and overexpressed genes on chromosome arm 20q by an integrative genomic approach in cervical 
#' cancer: potential role in progression. Genes Chromosomes Cancer 2008 Sep; 47(9):755-65. PMID: 18506748
#' 
#' @references Davis, S. and Meltzer, P. S. GEOquery: a bridge between the Gene Expression Omnibus (GEO) and
#' BioConductor. Bioinformatics, 2007, 14, 1846-1847
#' 
#' @format A list of 3 dataframes containing prepared sample, expression, and gene data
#' 
"GSE9750_cleaned"


#' Gene Expression Dataset - Cervical Cancer (original data)
#' 
#' @description This is the original, un-manipulated data from the below referenced study.  
#' That study was aimed  at identification of gene expression profiles in cervical cancer and the 
#' role of specific genes in cervical carcinogenesis.
#' 
#' @references Scotto L, Narayan G, Nandula SV, Arias-Pulido H et al. Identification of copy number 
#' gain and overexpressed genes on chromosome arm 20q by an integrative genomic approach in cervical 
#' cancer: potential role in progression. Genes Chromosomes Cancer 2008 Sep; 47(9):755-65. PMID: 18506748
#' 
#' @source \url{https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE9750}
#' 
#' @format a character vector by lines read
#' 
"GSE9750_original"
