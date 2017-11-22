# Define UI for application 
shinyUI(fluidPage(
  
  # Application title
  
  titlePanel("Logistic Regression Model Shiny App"),
  
  # Sidebar 
  
  sidebarLayout(
    
    sidebarPanel(   
      #choose Independent Variable
      selectInput('iv', h5('Independent Variable'),
                  choices = list("ScoreDiff" , "Distance" ))
    ),
    
    mainPanel(
      #tabsets 
      tabsetPanel(type = "tabs", 
                  tabPanel("Summary of Model",
                           verbatimTextOutput("model")),
                  tabPanel("Plot",
                           plotOutput("plots"))
      )
    )                         
    
  ))
)


