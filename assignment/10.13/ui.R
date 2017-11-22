library(shiny)
# Define UI for random distribution app ----
ui <- fluidPage(
  # Application title
  titlePanel("Assignment 7 - Football data"),
  # Sidebar with a dropdown using selectInput
  sidebarLayout(
    sidebarPanel(
      selectInput("myIV", "Independent Variable:",
                  choices=c("Distance", "ScoreDiff")),
      hr(),
      helpText("Please choose your independent variable")
    ),
    # Main panel for displaying outputs
    mainPanel(
      # Output: Tabset with summary and plot
      tabsetPanel(type = "tabs",
                  tabPanel("Summary",
                           verbatimTextOutput("myLogModelSummary")),
                  tabPanel("Plot", plotOutput("myLogPlot"))
      )
    )
  )
)