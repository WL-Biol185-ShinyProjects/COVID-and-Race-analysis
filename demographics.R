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

output$racePlot <- renderPlot({
  demographicsCOVIDdata %>%
    filter(areas == input$region) %>%
    arrange(pos_spec_dt) %>%
    ggplot(aes(`Race and ethnicity (combined)`, pos_spec_dt, fill = `Race and ethnicity (combined)`)) + 
    geom_histogram(stat= "identity")+
    theme(axis.text.x = element_text(angle = 0, hjust = 1))
})
