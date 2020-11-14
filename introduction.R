library(shiny)
library(shinydashboard)
library(markdown)

introductiontext <-
  fluidRow(
    titlePanel("The Coronavirus Disease 2019 in the United States"),
    column(width = 5,
           box(
             title = "Background on the COVID-19 Pandemic", width = NULL, background = "purple",
             "Since the initial outbreak of the COVID-19 disease in Wuhan, Hubei Province, China in December 2019, the virus has rapidly spread across the globe (Coronavirus disease (COVID-19) n.d.). As of November 11th, 2020 there are 10,170,846 cases in the United States and 51 million worldwide (CDC 2020b; WHO Coronavirus Disease (COVID-19) Dashboard n.d.). However, in the past few decades, COVID-19 is not the first disease to be caused by zoonotic coronaviruses. In 2002, an episode of severe respiratory disease emerged and scientists determined that the etiological agent of severe acute respiratory syndromes (SARS) is SARS coronavirus (SARS-CoV) – a member of the Severe acute respiratory syndrome-related coronavirus species. Both the SARS epidemic of 2002 and the Middle East respiratory syndrome coronavirus were associated with upper respiratory tract infections. Thus when multiple cases of pneumonia like symptoms emerged in December, the causative agent was identified as the coronavirus 2019-nCoV. Based on its genetic resemblance to SARS-CoV and a number of other SARS-like animal coronaviruses, the novel coronavirus that causes COVID-19 was identified as SARS-CoV-2 (Morty and Ziebuhr 2020).
                      Clinical evidence suggests that the primary mode of infection with SARS-CoV-2 is through exposure to infectious respiratory droplets. Infection through respiratory viruses can happen through direct transmission, droplet transmission, and airborne transmission. Droplet transmission is defined as infection through exposure to respiratory droplets from a contagious person who is within six feet of distance.  Airborne transmission is infection from smaller respiratory droplets and particles that can remain in the air for extended periods of time (CDC 2020a)."
           ),
           box(
             title = "Relevance", width = NULL, background = "purple",
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
           box(title = "Links for More Information", width = NULL, background = "purple",
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
                                   height="25%", width="50%",
                                   align = "middle",
                                   style="display: block; margin-left: auto; margin-right: auto;",
    
    h5()
    )
  )
)