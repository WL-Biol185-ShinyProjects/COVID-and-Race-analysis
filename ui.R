library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "COVID-19 Case Explorer"),
  dashboardSidebar(
    sidebarMenu(
    menuItem("Introduction", tabName = "Introduction", icon = icon("Introduction")),
    menuItem("Cases & Deaths", tabName = "Cases & Deaths", icon = icon("Cases & Deaths")),
    menuItem("Political Climate", tabName = "Political Climate", icon = icon("Political Climate")),
    menuItem("Demographics", tabName = "Demographics", icon = icon("Demographics")),
    menuItem("Data Explorer", tabName = "Data Explorer", icon = icon("Data Explorer"))
  )
  ),
  ## Body content
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              fluidRow(
                box(plotOutput("plot1", height = 250)),
                
                box(
<<<<<<< HEAD
                  title = "Covid",
=======
                  title = "Controls",
>>>>>>> aec8b0a4211f66f96fc40d99f6594032cd861358
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              )
      ),
      
      # Second tab content
      tabItem(tabName = "widgets",
              h2("Widgets tab content")
      )
    )
  )
)
