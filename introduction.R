library(shiny)
library(markdown)

fluidrow(
  column(4,
         includeMarkdown("introduction.md"))
)
