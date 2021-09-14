# Title     : get_current_file_location.R
# Objective : Retrieves the path of the file this function is run from.
# Created by: tho
# Created on: 10/9/2021

library(tidyverse)

#' Get the location of the current file.
#' 
#' Retrieves the path of the file this function is run from. Shamelessly stolen,
#' and renamed, from: https://stackoverflow.com/a/55322344
#' 
#' @return The path as a string.
#' @export
get_current_file_location <-  function()
{
  this_file <- commandArgs() %>% 
    tibble::enframe(name = NULL) %>%
    tidyr::separate(col=value, into=c("key", "value"), sep="=", fill='right') %>%
    dplyr::filter(key == "--file") %>%
    dplyr::pull(value)
  if (length(this_file)==0)
  {
    this_file <- rstudioapi::getSourceEditorContext()$path
  }
  return(dirname(this_file))
}
