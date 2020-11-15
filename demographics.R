library(shiny)
library(shinydashboard)
library(ggplot2)
library(tidyverse)

demographicsRaceCasesData <- read_csv("cases_by_race_ethnicity__all_age_groups.csv")
demographicsSexCasesData <- read_csv("cases_by_sex__all_age_groups.csv")
demographicsAgeCasesData <- read_csv("cases_by_age_group.csv")
demographicsRaceDeathsData <- read_csv("deaths_by_race_ethnicity__all_age_groups.csv")
demographicsSexDeathsData <- read_csv("deaths_by_sex__all_age_groups.csv")
demographicsAgeDeathsData <- read_csv("deaths_by_age_group.csv")


demographics <- 
fluidPage(
  titlePanel("Cases and Deaths by Demographics"),
  fluidRow(
  tabBox(
    title = "Cases",
    # The id lets us use input$tabset on the server to find the current tab
    id = "tabsetCases", height = "600px", width = 12,
    tabPanel("Race", plotOutput("raceCasesPlot"), "Cases in the United States based on Race/Ethnicity. Data represents 4,016,436 cases (52% of total cases). Data updated November 12 2020. Source: https://covid.cdc.gov/covid-data-tracker/#demographics."),
    tabPanel("Sex", plotOutput("sexCasesPlot"), "Cases in the United States based on Sex. Data represents 7,493,562 cases (98% of total cases). Data updated November 12 2020. Source: https://covid.cdc.gov/covid-data-tracker/#demographics."),
    tabPanel("Age", plotOutput("ageCasesPlot"), "Cases in the United States based on Age. Data represents 7,565,440 cases (99% of total cases). Data updated November 12 2020. Source: https://covid.cdc.gov/covid-data-tracker/#demographics.")
  )
),
  fluidRow(
  tabBox(
    title = "Deaths",
    id = "tabsetDeaths", height = "600px", width = 12,
    tabPanel("Race", plotOutput("raceDeathsPlot"), "Deaths in the United States based on Race/Ethnicity. Data represents 142,525 cases (80% of total deaths). Data updated November 12 2020. Source: https://covid.cdc.gov/covid-data-tracker/#demographics."),
    tabPanel("Sex", plotOutput("sexDeathsPlot"), "Deaths in the United States based on Sex. Data represents 176,151 deaths (99% of total deaths). Data updated November 12 2020. Source: https://covid.cdc.gov/covid-data-tracker/#demographics."),
    tabPanel("Age", plotOutput("ageDeathsPlot"), "Deaths in the United States based on Age. Data represents 176,610 deaths (99% of total deaths). Data updated November 12 2020. Source: https://covid.cdc.gov/covid-data-tracker/#demographics.")
    )
  )
)