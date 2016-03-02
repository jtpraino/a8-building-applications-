# Jared Praino 1461938
# Assignment 8, Building Applications
# INFO498F  
# Instructor:  Michael Freeman  
# TA: Jordan Hand

#setwd("C:/Users/Jared/Documents/info498f/a8-building-applications-")

library(shiny)
library(plotly)

# Create UI
shinyUI(navbarPage('Type of Graph',
  # Tabs for Histogram and Scatterplot are created
  tabPanel("Histogram",
    titlePanel("Iris Histogram"),
    # Controls
    sidebarLayout(
      sidebarPanel(
        # Choose species
        selectInput("hist_Species",
                      label = h3("Choose Species"),
                      choices = list("Setosa" = "setosa", "Versicolor" = "versicolor", "Virginica" = "virginica"),
                      selected = "setosa"),
        # Choose trait
        radioButtons("hist_trait",
                      label = "Trait:",
                      choices = list("Sepal Length" = "Sepal.Length", "Sepal Width" = "Sepal.Width",
                                    "Petal Length" = "Petal.Length", "Petal Width" = "Petal.Width"),
                      selected = "Sepal.Length")
      ),
      # Render histogram
      mainPanel(
        plotlyOutput('hist')
      )
    )
  ),
  tabPanel("Scatterplot",
    titlePanel("Iris Scatterplot"),
    # Controls
    sidebarLayout(
      sidebarPanel(
        # Choose species
        selectInput("scatter_Species",
                     label = h3("Choose Species"),
                     choices = list("Setosa" = "setosa", "Versicolor" = "versicolor", "Virginica" = "virginica"),
                     selected = "versicolor"),
        # Choose trait one
        radioButtons("scatter_trait1",
                    label = "X-Axis Trait (Must differ from Y-Axis Trait):",
                    choices = list("Sepal Length" = "Sepal.Length", "Sepal Width" = "Sepal.Width",
                                   "Petal Length" = "Petal.Length", "Petal Width" = "Petal.Width"),
                    selected = "Sepal.Length"),
        # Choose trait two
        radioButtons("scatter_trait2",
                    label = "Y-Axis Trait (Must differ from X-Axis Trait):",
                    choices = list("Sepal Length" = "Sepal.Length", "Sepal Width" = "Sepal.Width",
                                   "Petal Length" = "Petal.Length", "Petal Width" = "Petal.Width"),
                    selected = "Sepal.Width")
      ),
      # Render Scatterplot
      mainPanel(
        plotlyOutput('scatter')
      )
    )
  ),
  # Controls
  tabPanel("Boxplot",
      titlePanel("Iris Boxplot"),
      # Controls
      sidebarLayout(
       sidebarPanel(
         # Choose trait
         selectInput("box_trait",
                      label = "Trait:",
                      choices = list("Sepal Length" = "Sepal.Length", "Sepal Width" = "Sepal.Width",
                                     "Petal Length" = "Petal.Length", "Petal Width" = "Petal.Width"),
                      selected = "Sepal.Length")
       ),
       # Render Boxplot
       mainPanel(
         plotlyOutput('box')
       )
     )
  )
))