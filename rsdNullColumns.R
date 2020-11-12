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