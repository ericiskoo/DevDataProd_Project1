labels <- c("Miles/(US) gallon", "Displacement (cu.in.)", "Gross horsepower", 
            "Rear axle ratio", "Weight (lb/1000)", "1/4 mile time")

shinyUI(pageWithSidebar(
  headerPanel('Motor Trend Car Road Tests'),
  sidebarPanel(
    "Select car attribute variables to compare and display on the x- and y- axes of the scatterplot. Datapoints represent individual cars.", 
    br(),br(),
    selectInput('xcol', 'X-Axis', labels, selected=labels[5]),
    selectInput('ycol', 'Y-Axis', labels, selected=labels[1])
  ),
  mainPanel(
    "This course project uses data from the mtcars dataset from the R datasets library. It allows the user to interactively compare the relationship between two variables at a time by displaying a scatterplot, best-fit line, and resulting linear model.",
    br(),br(),
    plotOutput('plot1'), 
    verbatimTextOutput("text1"),
    verbatimTextOutput("model1")
  )
))
