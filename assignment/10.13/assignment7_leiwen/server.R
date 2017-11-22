
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
dataset = read.csv("kickers.csv")
shinyServer(function(input, output) {
  variable = reactive({
  data = dataset[,c(input$variable, "Success")]
  names(data) = c("x", "Success")
  data
  })
  
  output$S <- renderPrint({

    classifier.logistic = glm(formula = Success ~ .,
                              family = binomial,
                              data = variable())
    summary(classifier.logistic)

  })

})
