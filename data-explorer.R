library(shiny)
library(leaflet)
library(tidyverse)
library(rgdal)
library(lubridate)

coviddata <- read_csv("United_States_COVID-19_Cases_and_Deaths_by_State_over_Time.csv")

#Fix state abbreviations into full state names
states <- read_csv("states")
colnames(states) <- c("StateName", "Abbreviation")
datastates <- left_join(coviddata, states, by = c("state" = "Abbreviation"))

#Convert dates into character vectors
datastates$datadates <- as.Date(coviddata$submission_date, format = "%m/%d/%Y")

#Extract all updated data from dataset
totalcoviddata <- datastates %>% group_by(state) %>% 
  filter(datadates == max(datadates))


dataexplorerpage <- 
  fluidPage(
    box(
      titlePanel("Total Cases and Deaths in each State"),
      width = 12,
      leafletOutput("TotalDataExplorerPage"),
      "The total amount of cases and deaths in each state as of October 5, 2020."
    )
  )
