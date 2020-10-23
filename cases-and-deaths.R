library(shiny)
library(leaflet)
library(tidyverse)
library(rgdal)
 
casesOvertime <- read_csv("United_States_COVID-19_Cases_and_Deaths_by_State_over_Time.csv")
casesOvertime$detection_date <- as.Date(casesOvertime$submission_date, format = "%m/%d/%Y")
states <- read_csv("states")
colnames(states) <- c("StateName", "Abbreviation")
casesOvertime <- left_join(casesOvertime, states, by = c("state" = "Abbreviation"))
  
casesanddeaths <- 
  fluidRow(
    box(
      width = 12,
      leafletOutput("CasesandDeathsOvertime"),
      sliderInput("datesforcases", "Date", min(casesOvertime$detection_date), max(casesOvertime$detection_date), value = min(casesOvertime$detection_date), animate = TRUE)
    )
    
    
  )
