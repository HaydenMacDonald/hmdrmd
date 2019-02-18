tidy_analysis <- function(...){
  
  # Define filepaths
  template <- system.file("header.tex", package = "hmdrmd")
    
  
  # supply files to your custom format
  rmarkdown::pdf_document(..., 
                          includes = rmarkdown::includes(in_header = template),
                          latex_engine = "xelatex",
                          highlight = "kate")
}