library(shinydashboard)
#source pages here

dashboardPage(
  dashboardHeader(title = "COVID-19 Case Explorer"),
  dashboardSidebar(
    sidebarMenu(
    menuItem("Introduction", tabName = "Introduction"),
    menuItem("Cases & Deaths", tabName = "CasesDeaths"),
    menuItem("Political Climate", tabName = "PoliticalClimate"),
    menuItem("Demographics", tabName = "Demographics"),
    menuItem("Data Explorer", tabName = "DataExplorer")
  )
  ),
  ## Body content
  dashboardBody(
    tabItems(
<<<<<<< HEAD
      tabItem("Introduction", "Introduction goes here"),
      tabItem("CasesDeaths", "graphs go here")
=======
      # First tab content
      tabItem(tabName = "dashboard",
              fluidRow(
                box(plotOutput("plot1", height = 250)),
                
                box(

                  title = "Controls",
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              )
      ),
>>>>>>> f11927d629a5fbcd353c2737987fef9bc47e98df
      
    )
  )
)
