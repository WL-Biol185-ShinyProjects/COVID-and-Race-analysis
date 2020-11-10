library(shiny)
library(leaflet)

demographicsCOVIDdata <- readRDS("CDCcovidData.RDS")


demographics <- 
  fluidPage(
    titlePanel("Cases by Race"),
    sidebarLayout(
      sidebarPanel(
        selectInput("race", "Race and Ethnicity:",
                    choices = unique(demographicsCOVIDdata$`Race and ethnicity (combined)`),
                    selected = 1)
      ),
      mainPanel(
        plotOutput("racePlot")
        
        
      )
    )
  )


