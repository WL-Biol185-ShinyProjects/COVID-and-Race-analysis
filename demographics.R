library(shiny)
library(ggplot2)
library(tidyverse)

demographicsRaceData <- read_csv("cases_by_race_ethnicity__all_age_groups.csv")
demographicsSexData <- read_csv("cases_by_sex__all_age_groups.csv")
demographicsAgeData <- read_csv("cases_by_age_group.csv")



demographics <- 
  fluidRow( 
    box(
      titlePanel("Cases by Race"),
      width = 12,
      plotOutput("racePlot")
    ),
    box(
      titlePanel("Cases by Sex"),
      width = 12,
      plotOutput("sexPlot")
    ),
    box(
      titlePanel("Cases by Sex"),
      width = 12,
      plotOutput("agePlot")
    )
  )