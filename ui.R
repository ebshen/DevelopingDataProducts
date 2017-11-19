library(shiny)
library(plotly)
shinyUI(fluidPage(
  titlePanel("EPA Fuel Economy Data Browser"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderMPG", "Pick Range Combined MPG",
                  0, 136, value = c(0, 136)),
      sliderInput("sliderYear", "Pick Range Model Year",
                  1984, 2018, value = c(1984, 2018)),
      submitButton("Submit")
    ),
    mainPanel(
      h3("Vehicles"),
      plotlyOutput("plot1"),
      h4("Instructions:"),
      h4("Please wait for the first plot to generate"),
      h4("Choose ranges of MPG and model year and hit submit"),
      h4("Hover over data points to see popup data"),
      h4("Note, most EPA data is populated for model years > 2010")
    )
  )
))