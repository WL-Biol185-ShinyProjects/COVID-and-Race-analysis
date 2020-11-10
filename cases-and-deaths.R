library(shiny)
library(leaflet)
library(tidyverse)
library(rgdal)
 
casesOvertime <- read_csv("United_States_COVID-19_Cases_and_Deaths_by_State_over_Time.csv")
casesOvertime$detection_date <- as.Date(casesOvertime$submission_date, format = "%m/%d/%Y")
casestates <- read_csv("states")
colnames(casestates) <- c("StateName", "Abbreviation")
casesOvertime <- left_join(casesOvertime, casestates, by = c("state" = "Abbreviation"))

deathsOvertime <- read_csv("United_States_COVID-19_Cases_and_Deaths_by_State_over_Time.csv")
deathsOvertime$detection_date <- as.Date(deathsOvertime$submission_date, format = "%m/%d/%Y")
deathstates <- read_csv("states")
colnames(deathstates) <- c("StateName", "Abbreviation")
deathsOvertime <- left_join(deathsOvertime, deathstates, by = c("state" = "Abbreviation"))

casesanddeaths <- 
  fluidRow(
    box(
      titlePanel("Timeline of COVID-19 Cases"),
       width = 12,
      leafletOutput("CasesOvertime"),
      sliderInput("datesforcases", "Date", min(casesOvertime$detection_date), max(casesOvertime$detection_date), value = min(casesOvertime$detection_date), animate = TRUE),
      box(
        titlePanel("Timeline of COVID-19 Deaths"),
        width = 12,
        leafletOutput("DeathsOvertime"),
        sliderInput("datesfordeaths", "Date", min(deathsOvertime$detection_date), max(deathsOvertime$detection_date), value = min(deathsOvertime$detection_date), animate = TRUE)
      )
    ) 
  )


