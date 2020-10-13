#specifies what the app looks like
#graphs, widgets, extrsa
library(shiny)
fluidPage(
  titlePanel("Old Faightful Geyser Data"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)