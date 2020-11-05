library(shiny)
library(leaflet)
library(rgdal)
library(ggplot2)

#in this page, we'll clean up data and assign it to variables that can be referenced in the server and ui R pages.
poli16 <- read.csv("1976-2016-president.csv")
poli20 <- read.csv("1976-2016-president.csv")

#Here, we set up for 2020 election results
years <- list(year2016 = poli16,
              year2020 = poli20)

politicalclimate <- 
  fluidRow(
    box(
      width = 12,
      leafletOutput("PoliticalClimateOvertime"),
      selectInput("datesforcases", "Election Year", list(2016, 2020))
    )
  )  