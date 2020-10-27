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
<<<<<<< HEAD
)  
=======
)

>>>>>>> 19ab17cbcfcbcb09b6c2aef8f2b8d21a96888e86
