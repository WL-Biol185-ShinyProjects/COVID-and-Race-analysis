library(shiny)
library(leaflet)
library(rgdal)
library(ggplot2)


  #in this page, we'll clean up data and assign it to variables that can be referenced in the server and ui R pages.
  a <- read.csv("1976-2016-president.csv")
b <- read.csv("1976-2016-president.csv")

years <- list(year2016 = a,
              year2020 = b)

xyz <- renderLeaflet({
  data <- years[[input$year]]
  leaflet(data)
})

