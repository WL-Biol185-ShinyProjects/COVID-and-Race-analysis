library(shiny)
library(markdown)

fluidRow(
  column(4,
         includeMarkdown("introduction.md")
)
)