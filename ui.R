library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  headerPanel("How old is this Loblolly Pine Tree?"),
  
  # Sidebar with a slider input for the height of the tree
  sidebarLayout(
    sidebarPanel(width=6,
    p('According to the U.S. Forest Service, pinus taeda, commonly known as loblolly pine, 
         is one of several pines native to the Southeastern United States, from central Texas 
         east to Florida, and north to Delaware and southern New Jersey.  Its needles are in 
         bundles of three, sometimes twisted, and measure 12–22 cm (4.7–8.7 in) long.'),
    
     p('Many naturalists when strolling through a forest question
         how old the Loblolly pine trees are.  One technique to determine the age would be to cut the 
         tree down to determine how old it is (counting the rings in the trunk).  This method
         would ruin the tree.'),
     
     p('In the following analysis, data from the growth of Loblolly pine trees will be used to predict 
         the age of the tree by its height.  A logistic regression model was run to determine the effect of height on age of the tree.'),
    
     p('Imagine you are a naturalist strolling through a forest area in Texas and you notice a Loblolly 
         pine tree.  Measure the height of this tree, enter/submit this height in the space
         provided below.'),      
     
      numericInput('id1', 'Enter the height of the tree (in feet)', 0, min = 0, max = 1000, step = 1),
      submitButton('Submit')
    
   ),
    
    # Show a plot of the generated distribution
    mainPanel(width=6,
      plotOutput("distPlot"),
      h6('Based on a logistic regression prediction model of the data above, the predicted age (in years) for this tree will be determined by the height of the observed tree.'),
      h6('You entered the following height (in feet)'),
      verbatimTextOutput("inputValue"),
      h6('The predicted age of the observed tree (in years) is:'),
      verbatimTextOutput("prediction")
      )
  )
))