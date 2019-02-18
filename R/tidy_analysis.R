tidy_analysis <- function(...){
  
  # Define filepaths
  template <- system.file("header.tex", package = "hmdrmd")
    
  
  # supply files to your custom format
  format <- rmarkdown::pdf_document(..., 
                          includes = rmarkdown::includes(in_header = template),
                          latex_engine = "xelatex",
                          highlight = "kate")
  
  
  #Set output format to take knitr options
  chunk_options <- rmarkdown::knitr_options(opts_chunk = list(tidy.opts=list(width.cutoff=80)))
  
  format$knitr <- chunk_options
  format$inherits <- 'pdf_document'
  format
}