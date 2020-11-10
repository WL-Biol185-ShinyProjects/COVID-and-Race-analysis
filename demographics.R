library(shiny)
library(leaflet)

demographicsCOVIDdata <- readRDS("CDCcovidData.RDS")


demographics <- 
  fluidPage(
    titlePanel("Case by Race"),
    sidebarLayout(
      sidebarPanel(
        selectInput("region", "Region:",
                    choices = unique(demographicsCOVIDdata$`Race and ethnicity (combined)`),
                    selected = 1)
      ),
      mainPanel(
        plotOutput("racePlot")
        
        
      )
    )
  )

