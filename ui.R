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
      tabItem("Introduction", "Introduction goes here"),
      tabItem("CasesDeaths", "graphs go here")
      
    )
  )
)
