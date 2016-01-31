setwd("~/Dropbox/Carpentry/R_lesson/gapminder")

args <- commandArgs(TRUE)
print(args)

rm(list = ls())

dataDir <- 'data'
dataFile <- 'gapminder-FiveYearData.csv'
fileName <- file.path(dataDir, dataFile)

gapminder <- read.csv(fileName)

# select all data from a country

dataAfghanistan <- gapminder[gapminder$country == 'Afghanistan', ]

allCountryNames <- levels(gapminder$country)
unscPermanentMembers <- c('China', 'France', 'Russia', 'United Kingdom', 'United States')
southAmericanCountries <- c('Argentina', 'Bolivia', 'Brazil', 'Chile', 'Colombia', 'Ecuador', 'Paraguay', 'Peru', 'Uruguay', 'Venezuela')

getAverageGdpPerCapita <- function(country) {
  # extract
  
  selectedCountryData <- gapminder[gapminder$country == country, 'gdpPercap']
  
  mean(selectedCountryData)
}

gdpUSA <- getAverageGdpPerCapita('United States')
gdpCanada <- getAverageGdpPerCapita('Canada')
gdpMexico <- getAverageGdpPerCapita('Mexico')

averagedNorthAmericanGdp <- sapply(southAmericanCountries, getAverageGdpPerCapita)
barplot(averagedNorthAmericanGdp)

print(averagedNorthAmericanGdp)
