library(shiny)
library(shinydashboard)
library(markdown)

introductiontext <-
          fluidPage(
            titlePanel("The Coronavirus Disease 2019 in the United States"),
            column(width = 5,
                   box(
                     title = "Background on the COVID-19 Pandemic", width = NULL, solidHeader = TRUE, status = "primary",
                     "text goes here."
                   ),
                   box(
                     title = "Demographic Disparities in COVID-19", width = NULL, solidHeader = TRUE, status = "primary",
                     "text goes here."
                   ),
                   box(title = "Links for More Information", width = NULL, background = "blue",
                       a("SARS Timeline (CDC)", href = "https://www.cdc.gov/about/history/sars/timeline.htm", style = "color:LightGray;"),
                       br(),
                       a("SARS Information (CDC)", href = "https://www.cdc.gov/sars/index.html", style = "color:LightGray;"),
                       br(),
                       a("SARS Information and Reports (WHO)", href = "https://www.who.int/csr/sars/en/", style = "color:LightGray;"),
                       br(),
                       a("SARS-CoV as an Agent of Emerging and Reemerging Infection", href = "https://cmr.asm.org/content/20/4/660", style = "color:LightGray;"),
                       br(),
                       a("Learning from SARS: Preparing for the Next Disease Outbreak", href = "https://www.ncbi.nlm.nih.gov/books/NBK92458/", style = "color:LightGray;"),
                       br(),
                       a("Possible Bioweapons", href = "https://www.ncbi.nlm.nih.gov/pubmed/14703130", style = "color:LightGray;"))
            ),
            
            
            box(background = "purple", img(src = "COVID19infographic.png",
                                         style = "display: block; margin-left: auto, margin-right: auto;"
            ), 
            
            h5()
            )
          )
  