shinyServer(function(input, output) {
  
  
  #load data from file
  datasetInput <- reactive( {
    inFile = input$file
    
    if (!is.null(inFile))
      read.csv(inFile$datapath)

  }
  )
  # regression formula
  regFormula <- reactive({
    as.formula(paste("Success", '~', input$iv))
  })
  
  # bivariate model
  model <- reactive({
    mod = glm(regFormula(), data =   datasetInput(), family = binomial(link = "logit"))
    mod
  })
  
  #  model
  output$model <- renderPrint({
    summary(model())
  })
  
  #
  output$plots <- renderPlot({
    plot(as.formula(paste("Success", '~', input$iv)), data = datasetInput()) #original points
    preds = predict(model(),type = "response") #fitted values
    #re-order
    x =  datasetInput()[,input$iv]
    od = order(x)
    #add estimatd curve
    lines(x[od],preds[od],col="blue")
  })
}
)











