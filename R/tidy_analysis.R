#' Create an output format for tidy analysis from pdf_document
#' 
#' @inheritParams pdf_document
#' @param ... additional arguments passed to \code{\link{pdf_document}}
#'
#' @return This function returns an output format to generate a pdf document.
#' 
#' @note This function is not designed to be run from the console, but from the YAML header of the R Markdown document.
#'
#' @import rmarkdown
#' @import knitr
#' @import formatR
#' 
#' @export
tidy_analysis <- function(...){
  
  # Define filepath to custom header
  template <- system.file("header.tex", package = "hmdrmd")
    
  
  # supply files to custom format
  format <- rmarkdown::pdf_document(..., 
                          includes = rmarkdown::includes(in_header = template),
                          latex_engine = "xelatex")
  
  
  #Set output format to take knitr options
  chunk_options <- rmarkdown::knitr_options(opts_chunk = list(tidy.opts=list(width.cutoff=80)))
  knitr_options$opts_chunk$background = "#F5F5F5"
  
  format$knitr <- chunk_options
  format$inherits <- 'pdf_document'
  format
}