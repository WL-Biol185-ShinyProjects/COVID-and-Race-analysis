library(shiny)
library(markdown)

fluidPage(
  
  titlePanel("Coronavirus 2019: An Overview"),
  fluidRow(
    column(4,
           includeMarkdown(introduction.md)
    )
  )
)