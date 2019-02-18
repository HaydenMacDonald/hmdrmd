tidy_analysis <- function(...){
  
  # Define filepaths
  template <- system.file("header.tex", package = "hmdrmd")
    
  
  # supply files to your custom format
  rmarkdown::pdf_document(..., 
                          includes = rmarkdown::includes(in_header = template),
                          latex_engine = "xelatex",
                          highlight = "kate")
  
  
  #Set output format to take knitr options
  rmarkdown::output_format(
    base_format = "pdf_document",
    knitr = rmarkdown::knitr_options(opts_chunk = list(tidy.opts=list(width.cutoff=80))),
    pandoc = pandoc_options(to = "pdf")
  )
}