library(shinydashboard)
library(shiny)
library(leaflet)
library(ggplot2)

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
    casespalette <- colorBin("Purples", domain = log(casesOvertime$tot_cases))
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
    deathspalette <- colorBin("Purples", domain = log(deathsOvertime$tot_death))
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
  
  #This section is for DEMOGRAPHICS
  #this is the plot on cases and race
  output$tabsetCasesSelected <- renderText({
    input$tabsetCases
  })
  output$tabsetDeathsSelected <- renderText({
    input$tabsetDeaths
  })
  output$raceCasesPlot <- renderPlot({
    raceCasesSorted <- arrange(demographicsRaceCasesData, `Race/Ethnicity`)
    raceCasesOrdered <- mutate(raceCasesSorted, `Race/Ethnicity` = factor(`Race/Ethnicity`, levels = `Race/Ethnicity`, ordered = TRUE))
    demographicsRaceCasesData %>%
      ggplot(aes(`Race/Ethnicity`, Percentage, fill = `Race/Ethnicity`)) + 
      geom_histogram(stat = "identity") +
      theme(axis.text.x = element_text(size = 11, angle = 60, hjust = 1)) +
      theme(axis.text.y = element_text(size = 11, hjust = 1)) +
      theme(axis.title.x = element_text(size = 14, face = "bold")) +
      theme(axis.title.y = element_text(size = 12, face = "bold"))
  })
  
  #this is the plot on cases and sex
  output$sexCasesPlot <- renderPlot({
    demographicsSexCasesData %>%
      ggplot(aes(Sex, Percentage, fill = Sex)) + 
      geom_histogram(stat = "identity") +
      theme(axis.text.x = element_text(size = 11, angle = 60, hjust = 1)) +
      theme(axis.text.y = element_text(size = 11, hjust = 1)) +
      theme(axis.title.x = element_text(size = 14, face = "bold")) +
      theme(axis.title.y = element_text(size = 12, face = "bold"))
  })
  
  #this is the plot on cases and age
  output$ageCasesPlot <- renderPlot({
    demographicsAgeCasesData %>%
      ggplot(aes(`Age Group`, Percentage, fill = `Age Group`)) + 
      geom_histogram(stat = "identity") +
      theme(axis.text.x = element_text(size = 11, angle = 60, hjust = 1)) +
      theme(axis.text.y = element_text(size = 11, hjust = 1)) +
      theme(axis.title.x = element_text(size = 14, face = "bold")) +
      theme(axis.title.y = element_text(size = 12, face = "bold"))
  })
  
  #this is the plot on Deaths and race
  output$raceDeathsPlot <- renderPlot({
    raceDeathsSorted <- arrange(demographicsRaceDeathsData, `Race/Ethnicity`)
    raceDeathsOrdered <- mutate(raceDeathsSorted, `Race/Ethnicity` = factor(`Race/Ethnicity`, levels = `Race/Ethnicity`, ordered = TRUE))
    demographicsRaceDeathsData %>%
      ggplot(aes(`Race/Ethnicity`, Percentage, fill = `Race/Ethnicity`)) + 
      geom_histogram(stat = "identity") +
      theme(axis.text.x = element_text(size = 11, angle = 60, hjust = 1)) +
      theme(axis.text.y = element_text(size = 11, hjust = 1)) +
      theme(axis.title.x = element_text(size = 14, face = "bold")) +
      theme(axis.title.y = element_text(size = 12, face = "bold"))
  })
  
  #this is the plot on deaths and sex
  output$sexDeathsPlot <- renderPlot({
    demographicsSexDeathsData %>%
      ggplot(aes(Sex, Percentage, fill = Sex)) + 
      geom_histogram(stat = "identity") +
      theme(axis.text.x = element_text(size = 11, angle = 60, hjust = 1)) +
      theme(axis.text.y = element_text(size = 11, hjust = 1)) +
      theme(axis.title.x = element_text(size = 14, face = "bold")) +
      theme(axis.title.y = element_text(size = 12, face = "bold"))
  })
  
  #this is the plot on deaths and age
  output$ageDeathsPlot <- renderPlot({
    demographicsAgeDeathsData %>%
      ggplot(aes(`Age Group`, Percentage, fill = `Age Group`)) + 
      geom_histogram(stat = "identity") +
      theme(axis.text.x = element_text(size = 11, angle = 60, hjust = 1)) +
      theme(axis.text.y = element_text(size = 11, hjust = 1)) +
      theme(axis.title.x = element_text(size = 14, face = "bold")) +
      theme(axis.title.y = element_text(size = 12, face = "bold"))
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
    #binning colors
    #bins <- c(-1, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1, 0)
    bins <- c(-1, -.25, -.05, 0.6, .1, .3)
    statePoliData <- do.call(rbind, tableList)
    
    countryMap <- rgdal::readOGR("states.geo.json")
    countryMap@data <- left_join(countryMap@data, statePoliData, by = c("NAME" = "state"))
    palette <- colorBin("RdBu", domain = statePoliData$off50, bins = bins)
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



#This section is for the Data Explorer Tab (related to total cases an deaths based on each state)
  output$TotalDataExplorerPage <- renderLeaflet({
    
    countryMap <- rgdal::readOGR("states.geo.json")
    countryMap@data <- left_join(countryMap@data, 
                                 totalcoviddata, 
                                 by = c("NAME" = "StateName")
    )
    
    m <- leaflet(countryMap) %>%
      setView(-96, 37.8, 4)
    
    labels <- sprintf(
      "<strong>%s<strong><br>Total cases: %s<br>Total deaths: %s",
      countryMap@data$NAME, 
      countryMap@data$tot_cases, 
      countryMap@data$tot_death 
    ) %>% lapply(HTML)
    
    m %>% addPolygons(
      weight = 2,
      opacity = 1,
      fillColor = "mediumpurple",
      dashArray = "1",
      fillOpacity = 0.7,
      label = labels,
      highlight = highlightOptions(
        weight = 3,
        color = "#666",
        dashArray = "",
        fillOpacity = 0.7,
        bringToFront = TRUE))
    
  })
}