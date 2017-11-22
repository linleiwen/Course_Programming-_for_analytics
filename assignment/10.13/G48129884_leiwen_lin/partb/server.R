shinyServer(function(input, output) {
  
  data = read.csv("kickers.csv")
  
  # regression formula
  regFormula <- reactive({
    as.formula(paste("Success", '~', input$iv))
  })
  
  # bivariate model
  model <- reactive({
    mod = glm(regFormula(), data = data, family = binomial(link = "logit"))
  })
  
  #  model
  output$model <- renderPrint({
    summary(model())
  })
  
  #
  output$plots <- renderPlot({
    plot(as.formula(paste("Success", '~', input$iv)), data = data) #original points
    preds = predict(model(),type = "response") #fitted values
    #re-order
    x = data[,input$iv]
    od = order(x)
    #add estimatd curve
    lines(x[od],preds[od],col="blue")
  })
}
)