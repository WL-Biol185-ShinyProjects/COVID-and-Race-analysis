library(shiny)
library(leaflet)
library(tidyverse)
library(rgdal)

totalCases <- read_csv("United_States_COVID-19_Cases_and_Deaths_by_State_over_Time.csv")
totalCases$detection_date <- as.Date(totalCases$submission_date, format = "%m/%d/%Y")
states <- read_csv("states")
colnames(states) <- c("StateName", "Abbreviation")
totalCases <- left_join(totalCases, states, by = c("state" = "Abbreviation"))

totalDeaths <- read_csv("United_States_COVID-19_Cases_and_Deaths_by_State_over_Time.csv")
totalDeaths$detection_date <- as.Date(totalDeaths$submission_date, format = "%m/%d/%Y")
states <- read_csv("states")
colnames(states) <- c("StateName", "Abbreviation")
totalDeaths <- left_join(totalDeaths, states, by = c("state" = "Abbreviation"))

dataexplorer <- 
  fluidPage(
    width = 12,
    leafletOutput("DataExplorerPage")
  )
