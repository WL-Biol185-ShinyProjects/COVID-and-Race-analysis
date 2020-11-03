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

#Visualize Map
leaflet(countryMap) %>%
  setView(-98.483330, 38.712046, 3) %>%
  addPolygons(color = "#444444", weight = 1, smoothFactor = 0.5,
              opacity = 1.0, fillOpacity = 0.5,
              fillColor = ~colorFactor(c("blue", "red"), countryMap@data$party)(countryMap@data$party),
              highlightOptions = 
                highlightOptions(
                  color = "white", 
                  weight = 2, 
                  bringToFront = TRUE),
              popup = countryMap@data$popupText)

politicalclimate <- 
  fluidRow(
    box(
      width = 12,
      leafletOutput("PoliticalClimateOvertime"),
      sliderInput("datesforcases", "Date", min(casesOvertime$detection_date), max(casesOvertime$detection_date), value = min(casesOvertime$detection_date), animate = TRUE)
    )
  )  