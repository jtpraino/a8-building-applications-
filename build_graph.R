# Jared Praino 1461938
# Assignment 8, Building Applications
# INFO498F  
# Instructor:  Michael Freeman  
# TA:          Jordan Hand

#setwd("C:/Users/Jared/Documents/info498f/a8-building-applications-")

library(dplyr)
library(plotly)
library(datasets)

# Function used to create a histogram of a particular trait of a particular species of flower
build_hist <- function(data, species, trait) {
  # Isolate data relating to passed specie and trait variables
  df <- data %>% filter(Species == species) %>% select_(trait)
  # Create histogram
  # Data for the trait is found in the first column of the dataframe
  plot_ly(x = df[[1]], 
          type = "histogram",
          xbins = list(start = min(df[[1]])-.05,
                       end = max(df[[1]])+.05,
                       size = .1
                  )
         ) %>% layout(
            title = paste("Range of",trait,"in the",species,"species"),
            yaxis = list(title = paste("Number of Flowers")),
            xaxis = list(title = paste("Measurement of",trait, "(cm)"))
         ) %>% return()
}

# Function used to create a scatterplot comparing two particular traits of a particular species of flower
build_scatter <- function(data, species, trait_1, trait_2) {
  # Isolate data relating to passed specie and trait variables
  df <- data %>% filter(Species == species) %>% select_(trait_1, trait_2)
  # Data for x-axis is stored in the first column of the dataframe
  xmax <- max(df[[1]])
  # Data for the y-axis is stored in the second column of the dataframe
  ymax <- max(df[[2]])
  # Create scatterplot
  plot_ly(x = df[[1]],
          y = df[[2]],
          mode = "markers"
         ) %>% layout(
           title = paste(trait_1, "vs", trait_2, "in the", species, "species"),
           yaxis = list(range = c(0, ymax + 1.5), title = paste(trait_2,"(cm)")),
           xaxis = list(range = c(0, xmax + 1.5), title = paste(trait_1,"(cm)"))
         ) %>% return()
}