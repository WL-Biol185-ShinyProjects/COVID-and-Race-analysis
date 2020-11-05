library(shinydashboard)
library(shiny)
library(leaflet)

source("introduction.R")
source("political-climate.R")
source("data-explorer.R")
source("demographics.R")
source("cases-and-deaths.R")

# Define server logic required to plot various variables with COVID cases and deaths
function(input, output) {
#This section is related to the cases and deaths tab
  output$CasesandDeathsOvertime <- renderLeaflet({
    filteredData <- filter(casesOvertime, detection_date == input$datesforcases)
    statesGeo <- rgdal::readOGR("states.geo.json")
    statesGeo@data <- left_join(statesGeo@data, filteredData, by = c("NAME" = "StateName"))
    palette <- colorBin("Greens", domain = log(casesOvertime$tot_cases))
    leaflet(data = statesGeo) %>%
      setView(-96, 37.8, 4) %>%
      addPolygons(
        fillColor = ~palette(log(tot_cases)),
        weight = 2, #thickness around states
        #work on the label functionality
        label = statesGeo@data$NAME,
        opacity = 1, #statelines
        color = "black",
        fillOpacity = 0.7 #statepolygons
      ) %>%
      addLegend("bottomright",
                pal          = palette, 
                values       = ~(log(tot_cases)), 
                opacity      = 0.8,
                title        = "Log of Total Cases"
      )
  })
#This section is for demographics
  output$racePlot <- renderPlot({
    COVIDsurveillancedata %>%
      filter(areas == input$region) %>%
      arrange(Incidence) %>%
      ggplot(aes(Sex,Incidence, fill = Sex)) + 
      geom_histogram(stat= "identity")+
      theme(axis.text.x = element_text(angle = 0, hjust = 1))
  })
  
  #this section i s for the Political Climate tab
  output$PoliticalClimateOvertime <- renderLeaflet({
    poliData <- years[[input$year]]
    countryMap <- rgdal::readOGR("states.geo.json")
    countryMap@data <- left_join(countryMap@data, poliData, by = c("NAME" = "state"))
    countryMapData$popuptext <- paste(strong("State:"), poli16$state, br())
  })
}


#This section is for the Data Explorer Tab (related to total cases, deaths, hospitalizations etc based on each state)
