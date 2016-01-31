# This script will compute the average GDP per capita for Albania across the years

# read in the data
fileName <- 'data/gapminderData.csv'
gapminder <- read.csv(fileName)

countryName <- 'United States'

# extract the gdp column for "country" and find its average GDP per capita
computeAvgGdp <- function(countryName, startYear = 1990, endYear = 2000) {
  data <- gapminder[gapminder$country==countryName, ]
  dataYears <- data[data$year>=startYear & data$year<=endYear, ]
  gdpColumn <- dataYears[ , "gdpPercap"]
  avgGdp <- mean(gdpColumn)
  
  return(avgGdp)
}

begin <- 1950
end <- 1960
avgGdp <- computeAvgGdp(countryName)

# print the results
print(paste("The average GDP per cap of", countryName, "is", avgGdp))

# anonymous function
countries <- c('United States', 'United Kingdom', 'Ethiopia')
countriesAvgGdp50s <- sapply(countries, function(countryName) {
  computeAvgGdp(countryName, begin, end)
})
print(countriesAvgGdp50s)
begin <- 1990
end <- 2000
countriesAvgGdp90s <- sapply(countries, function(countryName) {
  computeAvgGdp(countryName, begin, end)
})
print(countriesAvgGdp90s)

barplot(countriesAvgGdp50s)
barplot(countriesAvgGdp90s)
