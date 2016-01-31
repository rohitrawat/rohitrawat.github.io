# function to surround a piece of text with other text
fence <- function(original, wrapper) {
  result <- paste0(wrapper, original, wrapper)
  
  return(result)
}
