library(shiny)
library(datasets)
data(Loblolly)

ageprediction <- function(id1) id1*.3783+.7574

# Define server logic required to draw a plot and do the prediction
shinyServer(function(input, output) {
  
  # Expressions that generate a plot and the prediction The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) The plot is non-reactive
  #  2) The prediction is "reactive" and therefore should re-execute automatically
  #     when inputs change
  
  output$distPlot <- renderPlot({
    # draw plot of chart
    plot(height~age, data=Loblolly, pch=19, col='purple', main="Loblolly Pine Tree Data - Height by Age", xlab="Tree Age (in years)", ylab="Tree Height (in feet)")
  })
  
  output$inputValue <- renderPrint({input$id1})
  output$prediction <- renderPrint({ageprediction(input$id1)})
})
