case_study <- function(...){
  
  # Define filepaths
  template <- system.file(package = "hmdrmd", "header.tex")
  
  # supply files to your custom format
  rmarkdown::pdf_document(..., 
                          includes = rmarkdown::includes(in_header = template),
                          latex_engine = "xelatex",
                          highlight = "kate")
}