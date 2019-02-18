tidy_analysis <- function(...){
  
  # Define filepaths
  template <- system.file(package = "hmdrmd", "header.tex")
  
  # supply files to your custom format
  rmarkdown::pdf_document(..., 
                          includes = includes(in_header = template),
                          latex_engine = "xelatex",
                          highlight = "kate")
}