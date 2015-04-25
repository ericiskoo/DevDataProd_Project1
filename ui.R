labels <- c("Miles/(US) gallon", "Displacement (cu.in.)", "Gross horsepower", 
            "Rear axle ratio", "Weight (lb/1000)", "1/4 mile time")

shinyUI(pageWithSidebar(
  headerPanel('Motor Trend Car Road Tests'),
  sidebarPanel(
    selectInput('xcol', 'X-Axis', labels, selected=labels[5]),
    selectInput('ycol', 'Y-Axis', labels, selected=labels[1])
  ),
  mainPanel(
    plotOutput('plot1'), 
    verbatimTextOutput("text1"),
    verbatimTextOutput("model1")
  )
))