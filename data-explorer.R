library(shiny)
library(leaflet)
library(tidyverse)
library(rgdal)

totalData <- readRDS("COVIDsurveillancedata.RDS")
totalData$
  states <- read_csv("states")
colnames(states) <- c("StateName", "Abbreviation")
totalData <- left_join(totalData, states, by = c("state" = "Abbreviation"))

casesanddeaths <- 
  fluidRow(
    box(
      width = 12,
      leafletOutput("CasesandDeathsOvertime"),
      sliderInput("datesforcases", "Date", min(casesOvertime$detection_date), max(casesOvertime$detection_date), value = min(casesOvertime$detection_date), animate = TRUE)
    )
    
    
  )