library(shinydashboard)

ui <- dashboardPage(
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
      tabItem(tabName = "Introduction",
              fluidRow(
                box(plotOutput("plot1", height = 250)),
                
                box(
                  title = "covid",
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              )
      ),
      
      # Second tab content
      tabItem(tabName = "Cases & Deaths",
              h2("Widgets tab content")
      )
    )
  )
)

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

shinyApp(ui, server)