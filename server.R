library(shiny)

# Define server logic required to draw a histogram
function(input, output) {
  
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
}

# input$bin is inside a render plot so it updates everytime input$bins updates
# distplot in ui and slider input in ui and then in server code all we needed out was output$dist plot and render plot to put it all together
# shiny does everything for us

#you can use other script files besides ui and server. the source() function allows you to call other script files
#source takes the code from another file and runs it in the place you called source
  #allows you to not have huge ui and server files. each feature is in its own file and it avoids merge conflicts
  #separate components into script files
