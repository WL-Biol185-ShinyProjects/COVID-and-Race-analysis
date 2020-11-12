library(shiny)
library(leaflet)
library(tidyverse)
library(rgdal)
library(lubridate)

cases <- read_csv("United_States_COVID-19_Cases_and_Deaths_by_State_over_Time.csv")
states <- read_csv("states")
colnames(states) <- c("StateName", "Abbreviation")
casesstates <- left_join(cases, states, by = c("state" = "Abbreviation"))
cases$datescases <- as.Date(cases$submission_date, format = "%m/%d/%Y")
uptodatecases <- cases %>% group_by(state) %>% 
  filter(datescases == max(datescases))
totalcasesdata = uptodatecases[,c ('state', 'tot_death')]

deaths <- read_csv("United_States_COVID-19_Cases_and_Deaths_by_State_over_Time.csv")
states <- read_csv("states")
colnames(states) <- c("StateName", "Abbreviation")
deathsstates <- left_join(deaths, states, by = c("state" = "Abbreviation"))
deaths$datesdeaths <- as.Date(deaths$submission_date, format = "%m/%d/%Y")
uptodatedeaths <- deaths %>% group_by(state) %>% 
  filter(datesdeaths == max(datesdeaths))
totaldeathsdata = uptodatedeaths[,c ('state', 'tot_death')]

dataexplorerpage <- 
  fluidPage(
    box(
      titlePanel("Total Cases and Deaths in each State"),
      width = 12,
      leafletOutput("TotalDataExplorerPage")
    )
  )
