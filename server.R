# Jared Praino 1461938
# Assignment 8, Building Applications
# INFO498F  
# Instructor:  Michael Freeman  
# TA: Jordan Hand

#setwd("C:/Users/Jared/Documents/info498f/a8-building-applications-")

library(shiny)
library(plotly)
library(datasets)

# Data set used for analysis
flower_data <- iris
# Contains functions for creating histogram and scatterplot
source('build_graph.R')
shinyServer(function(input, output) {
  # Render Histogram
  output$hist <- renderPlotly({
    build_hist(flower_data, 
                input$hist_Species, 
                input$hist_trait)
  })
  # Render Scatterplot
  output$scatter <- renderPlotly({
    build_scatter(flower_data,
                input$scatter_Species,
                input$scatter_trait1,
                input$scatter_trait2)
  })
})