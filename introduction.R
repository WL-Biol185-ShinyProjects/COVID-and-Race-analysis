library(shiny)
library(markdown)

introductiontext <-
          fluidRow(
            titlePanel("The Coronavirus Disease 2019 in the United States"),
            column(width = 5,
                   box(
                     title = "", width = NULL, solidHeader = TRUE, status = "primary",
                     "The first cases of SARS in late 2002 and early 2003 in Asia were recorded as atypical pneumonia.
                                     By March 2003, the World Health Organization released a global alert for this atypical, severe pneuomonia
                                     of unknown origin, and the Center for Disease Control began to issue health alerts. 
                                       SARS became the first major pandemic of the millenium. A novel coronavirus (named SARS-CoV) 
                                       was determined to cause SARS. SARS-CoV has been found in the civet, a mammalian animal found 
                                       in China, and horseshoe bats. Since 2004, there have not been any reported cases of SARS, 
                                     but the disease has been watched for possible reemergence."
                   ),
                   box(
                     title = "Relevance", width = NULL, solidHeader = TRUE, status = "primary",
                     "Why are we concerned about a past epidemic? SARS is being watched closely for 
                                     possible reemergence since it has not been completely eradicated. Pandemics of 
                                     infectious diseases are predicted to only increase with globalization. Yet, globalization
                                     also allowed for a more coordinated response to control SARS outbreaks. Data on the 2003 SARS
                                     epidemic and global responses to the epidemic are an invaluable resource for coordinating global
                                     responses to epidemics in the future. In 2012, SARS Co-V was declared a select agent, which means 
                                     it could possibly pose severe threats to public health and safety. This means that SARS Co-V, and 
                                     related coronaviruses, are potential candidates for bioterrorism. Studying the epidemiology of this
                                     coronavirus is important in understanding the nature of infectious diseases as a whole."
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
            
            
            box(background = "blue", img(src = "SARSspreadResized.png",
                                         style = "display: block; margin-left: auto, margin-right: auto;"
            ), 
            
            h5()
            )
          )
  