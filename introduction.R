library(shiny)
library(shinydashboard)
library(markdown)

introductiontext <-
  fluidPage(
    titlePanel("The Coronavirus Disease 2019 in the United States"),
    column(width = 6,
           box(
             title = "Background on the COVID-19 Pandemic", width = NULL, background = "purple",
             "Since the initial outbreak of the COVID-19 disease in Wuhan, Hubei Province, 
             China in December 2019, the virus has rapidly spread across the globe. 
             As of November 11th, 2020 there are 10,170,846 cases in the United 
             States and 51 million worldwide. However, in the past few decades, COVID-19 
             is not the first disease to be caused by zoonotic coronaviruses. In 2002, an 
             episode of severe respiratory disease emerged and scientists determined that 
             the etiological agent of severe acute respiratory syndromes (SARS) is SARS coronavirus 
             (SARS-CoV) – a member of the Severe acute respiratory syndrome-related coronavirus species. 
             Both the SARS epidemic of 2002 and the Middle East respiratory syndrome coronavirus were 
             associated with upper respiratory tract infections. Thus when multiple cases of pneumonia 
             like symptoms emerged in December, the causative agent was identified as the coronavirus 
             2019-nCoV. Based on its genetic resemblance to SARS-CoV and a number of other SARS-like 
             animal coronaviruses, the novel coronavirus that causes COVID-19 was identified as SARS-CoV-2.
            Clinical evidence suggests that the primary mode of infection with SARS-CoV-2 is through 
             exposure to infectious respiratory droplets. Infection through respiratory viruses can 
             happen through direct transmission, droplet transmission, and airborne transmission. 
             Droplet transmission is defined as infection through exposure to respiratory droplets 
             from a contagious person who is within six feet of distance.  Airborne transmission is 
             infection from smaller respiratory droplets and particles that can remain in the air 
             for extended periods of time."
           ),
           box(
             title = "Demographic Disparities in COVID-19 Cases and Deaths", width = NULL, background = "purple",
             "Race and ethnicity are risks for higher chance of disease and for other underlying 
             conditions that impact health such as, socioeconomic status, access to health case, 
             and increased exposure to COVID-19 due to occupation. Jobs that increase exposure 
             include frontline works like doctors or nurses, essential workers, and infrastructure 
             workers. Black people have a ratio that is 2.6x higher than white persons of being infected with SARS-CoV-2, including a 4.7x higher ratio of 
             being hospitalized, and 2.1x higher ratio of death. Additionally, Hispanic or Latinos have a ratio that is 2.8x higher 
             than white persons for cases, 4.6x higher for hospitalizations, and 1.1x higher for deaths."
           ),
           box(title = "Links for More Information", width = NULL, background = "purple",
               a("COVID-19 Information (World Health Organization)", href = "https://www.who.int/news-room/q-a-detail/coronaviruse-disease-covid-19", style = "color:LightGray;"),
               br(),
               a("SARS-CoV-2 Transmission", href = "https://www.cdc.gov/coronavirus/2019-ncov/more/scientific-brief-sars-cov-2.html", style = "color:LightGray;"),
               br(),
               a("COVID-19 Cases and Deaths by Race", href = "https://www.cdc.gov/coronavirus/2019-ncov/covid-data/investigations-discovery/hospitalization-death-by-race-ethnicity.html", style = "color:LightGray;"),
               br(),
               a("COVID-19 Cases Dashboard (CDC)", href = "https://covid.cdc.gov/covid-data-tracker", style = "color:LightGray;"),
               br(),
               a("COVID-19 Cases Dashboard (World Health Organization)", href = "https://covid19.who.int", style = "color:LightGray;"))
    ),
    
    
    img(src = "COVID19infographic.png",
                                   height="25%", width="50%",
                                   align = "middle",
                                   style="display: block; margin-left: auto; margin-right: auto;",
    
    h5()
    )
  )
