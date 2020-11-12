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
  output$CasesOvertime <- renderLeaflet({
    filteredcasesData <- filter(casesOvertime, detection_date == input$datesforcases)
    statescasesGeo <- rgdal::readOGR("states.geo.json")
    statescasesGeo@data <- left_join(statescasesGeo@data, filteredcasesData, by = c("NAME" = "StateName"))
    casespalette <- colorBin("Greens", domain = log(casesOvertime$tot_cases))
    leaflet(data = statescasesGeo) %>% 
      setView(-96, 37.8, 4) %>%
      addPolygons(
        fillColor = ~casespalette(log(tot_cases)),
        weight = 2, #thickness around states
        #work on the label functionality
        label = statescasesGeo@data$NAME,
        opacity = 1, #statelines
        color = "black",
        fillOpacity = 0.7 #statepolygons
      ) %>%
      addLegend("bottomright",
                pal          = casespalette, 
                values       = ~(log(tot_cases)), 
                opacity      = 0.8,
                title        = "Log of Total Cases"
      )
  })
  output$DeathsOvertime <- renderLeaflet({
    filtereddeathsData <- filter(deathsOvertime, detection_date == input$datesfordeaths)
    statesdeathsGeo <- rgdal::readOGR("states.geo.json")
    statesdeathsGeo@data <- left_join(statesdeathsGeo@data, filtereddeathsData, by = c("NAME" = "StateName"))
    deathspalette <- colorBin("Greens", domain = log(deathsOvertime$tot_death))
    leaflet(data = statesdeathsGeo) %>% 
      setView(-96, 37.8, 4) %>%
      addPolygons(
        fillColor = ~deathspalette(log(tot_death)),
        weight = 2, #thickness around states
        #work on the label functionality
        label = statesdeathsGeo@data$NAME,
        opacity = 1, #statelines
        color = "black",
        fillOpacity = 0.7 #statepolygons
      ) %>%
      addLegend("bottomright",
                pal          = deathspalette, 
                values       = ~(log(tot_death)), 
                opacity      = 0.8,
                title        = "Log of Total Deaths"
      )
  })
  
  #This section is for demographics
  output$racePlot <- renderPlot({
    demographicsCOVIDdata %>%
      arrange(pos_spec_dt) %>%
      ggplot(aes(`Race and ethnicity (combined)`, pos_spec_dt, fill = `Race and ethnicity (combined)`)) + 
      geom_histogram(stat= "identity")+
      theme(axis.text.x = element_text(angle = 0, hjust = 1))
  })
  
  #this section is for the Political Climate tab
  output$PoliticalClimateOvertime <- renderLeaflet({
    poliData <- years[[input$electionyear]]
    
    tableList <- lapply(seq(1, nrow(poliData), by = 2),
                        function(rown) {
                          currentRows <- poliData[c(rown, rown + 1), ]
                          data.frame(
                            state  = currentRows$state[1],
                            pctRep = currentRows$candidatevotes[1] / currentRows$totalvotes[1],
                            pctDem = currentRows$candidatevotes[2] / currentRows$totalvotes[2],
                            off50  = (currentRows$candidatevotes[2] / currentRows$totalvotes[2]) - 0.5
                          )
                        })
    
    statePoliData <- do.call(rbind, tableList)
    
    countryMap <- rgdal::readOGR("states.geo.json")
    countryMap@data <- left_join(countryMap@data, statePoliData, by = c("NAME" = "state"))
    palette <- colorBin("RdBu", domain = statePoliData$off50)
    #leaflet goes here
    leaflet(countryMap) %>%
      setView(-98.483330, 38.712046, 3) %>%
      addPolygons(
        fillColor = ~palette(off50),
        weight = 2,
        label = countryMap@data$state,
        opacity = 1,
        color = "black",
        fillOpacity = 0.7
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


