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
    demographicsCOVIDdata %>%
      filter(areas == CDCcovidData$`Race and ethnicity (combined)`) %>%
      arrange(pos_spec_dt) %>%
      ggplot(aes(`Race and ethnicity (combined)`, pos_spec_dt, fill = `Race and ethnicity (combined)`)) + 
      geom_histogram(stat= "identity")+
      theme(axis.text.x = element_text(angle = 0, hjust = 1))
  })
  
  #this section is for the Political Climate tab
  output$PoliticalClimateOvertime <- renderLeaflet({
    poliData <- years[[input$electionyear]]
    countryMap <- rgdal::readOGR("states.geo.json")
    countryMap@data <- left_join(countryMap@data, poliData, by = c("NAME" = "state"))
  #leaflet goes here
  leaflet(countryMap) %>%
    setView(-98.483330, 38.712046, 3) %>%
    addPolygons(color = "#444444", weight = 1, smoothFactor = 0.5,
                opacity = 1.0, fillOpacity = 0.5,
                fillColor = ~colorFactor(c("blue", "red"), nationwideGEO@data$party)(nationwideGEO@data$party),
                highlightOptions = 
                  highlightOptions(
                    color = "white", 
                    weight = 2, 
                    bringToFront = TRUE),
                #popup = nationwideGEO@data$popupText)
    )
  })



#This section is for the Data Explorer Tab (related to total cases, deaths, hospitalizations etc based on each state)
  output$DataExplorerPage <- renderLeaflet({
    filteredCases <- filter(totalCases, max(submission_date) == input$datesforcases)
    filteredDeaths <- filter(totalDeaths, max(submission_date) == input@datesfordeaths)
    mergedData <- geo_join(filteredCases, filteredDeaths, statesGeo, "Total Cases", "Total Deaths", "State")
    statesGeo <- rgdal::readOGR("states.geo.json")
    statesGeo@data <- left_join(statesGeo@data, filteredCases, filteredDeaths, by = c("NAME" = "StateName"))
    totalData$hover <- with(mergedData, paste(state, '<br>', "Total Cases", filteredCases, "<br>", "Total Deaths", filteredDeaths))
    pale <- colorNumeric("Greens", domain=mergedData)
  
  popup <- paste("Total Statistics: ", as.character(mergedData))
  
  leaflet("dataexplorerpage") %>%
    addTiles("CartoDB.Positron") %>%
    setView(-98.483330, 38.712046, zoom = 4) %>% 
    addPolygons(data = mergedData , 
                fillColor = ~pale(mergedData), 
                fillOpacity = 0.9, 
                weight = 0.2, 
                smoothFactor = 0.2,
                highlight = highlightOptions(
                  weight = 5,
                  color = "#666",
                  dashArray = "",
                  fillOpacity = 0.7,
                  bringToFront = TRUE),
                label=popup,
                labelOptions = labelOptions(
                  style = list("font-weight" = "normal", padding = "3px 8px"),
                  textsize = "15px",
                  direction = "auto"))
    })
}


