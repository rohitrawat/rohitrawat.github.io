countyList <- commandArgs(TRUE)

print(countyList)

fileName <- 'data/gapminderData.csv'
gapminder <- read.csv(fileName)

getAverageGdpPerCapita <- function(country) {
  # extract gdpPercap from the gapminder data four the specified country.
  
  selectedCountryData <- gapminder[gapminder$country == country, 'gdpPercap']
  
  mean(selectedCountryData)
}

averagedGdp <- sapply(countyList, getAverageGdpPerCapita)
barplot(averagedGdp)

print(averagedGdp)
