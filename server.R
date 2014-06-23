library(shiny)
data(mtcars)

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
  
  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$newlm expressions
  formulaText <- reactive({
    paste("mpg ~", input$predictor)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against mpg
  output$newlm <- renderPlot({
    fit <- lm(as.formula(formulaText()), mtcars)
    plot(fit$model[,2], fit$model[,1], xlab=input$predictor, ylab=input$outcome,
         main='Fit a linear regression model on the mtcars dataset')
    abline(a=coef(fit)[1], b=coef(fit)[2], col='red', lwd=2)
    legend("topright","fittet line",lty=1,col="red",lwd=2)
  })
})