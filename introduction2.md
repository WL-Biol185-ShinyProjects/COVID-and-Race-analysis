

![](http://example.com/logo.png)

![optional caption text](figures/img.png)



introductiontext <-
  fluidRow(
    box(
      width = 6,
      includeMarkdown("introduction.md"
      )
     ),
    box(
      width = 6,
      includeMarkdown("introduction2.md"
      )
    )
  )