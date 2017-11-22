shinyServer(function(input, output) {
  
  data = read.csv("kickers.csv")
  
  # regression formula
  regFormula <- reactive({
    as.formula(paste("Success", '~', paste(input$iv, collapse = "+")))
  })
  
  # bivariate model
  model <- reactive({
    mod = glm(regFormula(), data = data, family = binomial(link = "logit"))
  })
  
  #  model
  output$model <- renderPrint({
    summary(model())
  })
  
}
)
