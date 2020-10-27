tabItems(
  # Introduction Page
  tabItem(tabName = "Introduction",
          fluidRow(
            box(plotOutput("plot1")),
            
            box(
              "Box content here", br(), "More box content",
              sliderInput("slider", "Slider input:", 1, 100, 50),
              textInput("text", "Text input:")
            )
          )
  )
)  
