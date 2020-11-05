library(shiny)
library(leaflet)

demographicsCOVIDdata <- readRDS("~/COVID-and-Race-analysis/COVIDsurveillancedata.RDS")


demographics <- 
  fluidPage(
    titlePanel("Case by Race"),
    sidebarLayout(
      sidebarPanel(
        selectInput("region", "Region:",
                    choices = sort(demographicsCOVIDdata$`Race and ethnicity (combined)`),
                    selected = 1)
      ),
      mainPanel(
        plotOutput("racePlot")
        
        
      )
    )
  )

