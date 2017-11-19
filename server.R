library(shiny)
library(plotly)
data <- read.csv("vehicles.csv")
shinyServer(function(input, output) {
  output$plot1 <- renderPlotly({
    minMPG <- input$sliderMPG[1]
    maxMPG <- input$sliderMPG[2]
    minYear <- input$sliderYear[1]
    maxYear <- input$sliderYear[2]
    dataPlot <- data[data$comb08U >= minMPG & data$comb08U <= maxMPG,]
    dataPlot <- dataPlot[dataPlot$year >= minYear & dataPlot$year <= maxYear,]
    plot_ly(data = dataPlot, x = ~make, y = ~comb08U, type = "scatter", mode = "markers",
            text = ~paste("Make: ", make,
                          "<br>Model: ", model,
                          "<br>Year: ", year,
                          "<br>Highway MPG: ", highway08,
                          "<br>City MPG: ", city08,
                          "<br>Combined MPG", comb08,
                          "<br>FE Score: ", feScore)) %>%
      layout(title = "EPA Fuel Economy Data",
             xaxis = list(title = "Make"),
             yaxis = list(title = "Combined MPG"))
    
  })
})