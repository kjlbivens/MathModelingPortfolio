# install.packages("shiny")  # run once if you don't have it

library(shiny)

# coefficients from the problem
b0 <- 12.5
b1 <- 3.1
b2 <- -0.8
b3 <- 0.45

ui <- fluidPage(
  titlePanel("Convoy Fuel Consumption Predictor"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("weight", "Vehicle weight (tons):", value = 32, min = 0),
      numericInput("speed", "Average speed (mph):", value = 42, min = 0),
      numericInput("distance", "Distance traveled (miles):", value = 85, min = 0),
      helpText("Model: ŷ = 12.5 + 3.1*x1 - 0.8*x2 + 0.45*x3"),
      helpText("x1 = weight, x2 = speed, x3 = distance")
    ),
    
    mainPanel(
      h3("Predicted fuel consumption"),
      verbatimTextOutput("pred_text"),
      helpText(
        "This tool uses a linear regression model fit on 150 previous convoy trips ",
        "to estimate fuel use in gallons."
      )
    )
  )
)

server <- function(input, output, session) {
  
  output$pred_text <- renderText({
    x1 <- input$weight
    x2 <- input$speed
    x3 <- input$distance
    
    y_hat <- b0 + b1 * x1 + b2 * x2 + b3 * x3
    
    paste0("Predicted fuel consumed: ",
           round(y_hat, 2),
           " gallons")
  })
}

shinyApp(ui = ui, server = server)

