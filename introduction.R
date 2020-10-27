library(shiny)
library(markdown)

introductiontext <-
  fluidRow(
    column(4,
         includeMarkdown("introduction.md")
  )
)