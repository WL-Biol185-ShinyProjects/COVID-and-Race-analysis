library(shiny)
library(leaflet)
library(rgdal)
library(ggplot2)

#in this page, we'll clean up data and assign it to variables that can be referenced in the server and ui R pages.
poli16 <- read.csv("1976-2016-president.csv")
poli20 <- read.csv("1976-2016-president.csv")

years <- list(year2016 = poli16,
              year2020 = poli20)
politicalclimate <- 
  fluidRow(
    box(
      width = 12,
      leafletOutput("PoliticalClimateOvertime")
      #from here on out, not too sure. Make sure to add back the comma on the line above.
      #sliderInput("datesforcases", "Date", min(casesOvertime$detection_date), max(casesOvertime$detection_date), value = min(casesOvertime$detection_date), animate = TRUE)
    )
  )  