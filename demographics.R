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
    tabPanel("Race", plotOutput("raceCasesPlot")),
    tabPanel("Sex", plotOutput("sexCasesPlot")),
    tabPanel("Age", plotOutput("ageCasesPlot"))
  )
),
  fluidRow(
  tabBox(
    title = "Deaths",
    id = "tabsetDeaths", height = "600px", width = 12,
    tabPanel("Race", plotOutput("raceDeathsPlot")),
    tabPanel("Sex", plotOutput("sexDeathsPlot")),
    tabPanel("Age", plotOutput("ageDeathsPlot"))
    )
  )
)