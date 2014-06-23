library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Example of Linear Regression"),
  
  # Sidebar with controls to select a dataset and specify the number
  # of observations to view
  sidebarPanel(
    
    h4('In this Shiney application, we focus on the mtcars dataset. You will
        learn to fit a linear regression model of weight (predictor) on mpg (outcome).
        Please choose the predictor and the outcome for linear regression model.'),
    
    selectInput("predictor", "Choose the predictor:", 
                choices = c("wt", "drat", "qsec")),
    
    selectInput("outcome", "Choose the outcome:", 
                choices = c("mpg")),
    
    helpText("Note: After you choose the predictor and the outcome, please",
             "click the following button 'Fit'. Then, you can observe a figure",
             "of linear regression model on the rightside"),
    
    submitButton("Fit")
  ),
  
  # Show a summary of the dataset and an HTML table with the requested
  # number of observations
  mainPanel(
    h3(textOutput("caption")),
    
    plotOutput('newlm')
  )
))