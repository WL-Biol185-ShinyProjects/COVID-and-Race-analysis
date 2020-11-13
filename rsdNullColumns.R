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
demographics <- fluidPage(
  mainPanel( 
    tabsetPanel(
      tabPanel("Cases by Race"), 
      plotOutput("racePlot"), 
      tabPanel("Cases by Sex"),
      plotOutput("sexPlot"), 
      tabPanel("Cases by Age"), 
      plotOutput("agePlot")
    )
  )
)



fluidRow( 
  box(
    titlePanel("Cases by Race"),
    plotOutput("raceCasesPlot")
  ),
  box(
    titlePanel("Cases by Sex"),
    plotOutput("sexCasesPlot")
  ),
  box(
    titlePanel("Cases by Sex"),
    plotOutput("ageCasesPlot")
  ),
  box(
    titlePanel("Deaths by Race"),
    plotOutput("raceDeathsPlot")
  ),
  box(
    titlePanel("Deaths by Sex"),
    plotOutput("sexDeathsPlot")
  ),
  box(
    titlePanel("Deaths by Age"),
    plotOutput("ageDeathsPlot")
  )
)
