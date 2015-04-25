palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

names(mtcars) <- c("Miles/(US) gallon", "Number of cylinders", "Displacement (cu.in.)", 
                   "Gross horsepower", "Rear axle ratio", "Weight (lb/1000)", 
                   "1/4 mile time", "V/S", "Transmission (0 = automatic, 1 = manual)",
                   "Number of forward gears", "Number of carburetors")

shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    mtcars[, c(input$xcol, input$ycol)]
  })
  
  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData())
    abline(lm(mtcars[, input$ycol]~mtcars[, input$xcol]), col="red")
  })
  output$text1 <- renderText(paste(
    input$ycol,
    "~",
    input$xcol
  ))
  output$model1 <- renderText(paste(
    "y = ",
    coef(lm(mtcars[, input$ycol]~mtcars[, input$xcol]))[2],
    "x + ",
    coef(lm(mtcars[, input$ycol]~mtcars[, input$xcol]))[1],
    sep = ""
  ))
})