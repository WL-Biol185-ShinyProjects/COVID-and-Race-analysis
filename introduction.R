library(shiny)
library(markdown)

introductiontext <-
  fluidRow(
    box(
      width = 12,
      includeMarkdown("introduction.md"
      )
  )
)
