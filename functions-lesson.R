# Write functions to convert temperature

# a function to convert temperature in Fahr. to Celc.
convertFarhToCelc <- function(tempFahr) {
  # the body of the function goes here
  tempCelc <- (tempFahr - 32) * (5/9)
  
  return(tempCelc)
}

waterBPFahr <- 212
waterBPCelc <- convertFarhToCelc(waterBPFahr)

# print(tempCelc)

print(paste("The boiling point of water is", waterBPFahr, "F or", waterBPCelc, "C"))
      
print(paste("The room temperature is", 72, "F or", convertFarhToCelc(72), "C"))

convertFahrToKelvins <- function(tempFahr) {
  tempKelvins <- convertFarhToCelc(tempFahr) + 273.15
}

waterBPKelvin <- convertFahrToKelvins(waterBPFahr)
print(paste("The boiling point of water is", waterBPFahr, "F, or", waterBPCelc, "C, or", waterBPKelvin, "K"))
