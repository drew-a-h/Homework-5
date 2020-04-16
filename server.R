# server.R

source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps) 
library(mapproj)

shinyServer(
  function(input, output) {
    output$map <- renderPlot({
      
      switch(input$var, 
             "Percent Black" = percent_map(counties$black, "blue", which.min(counties$black), which.max(counties$black)),
             "Percent Asian" = percent_map(counties$asian, "yellow", which.min(counties$asian), which.max(counties$asian)),
             "Percent Hispanic" = percent_map(counties$hispanic, "green", which.min(counties$hispanic), which.max(counties$hispanic)),
             "Percent White" = percent_map(counties$white, "red", which.min(counties$white), which.max(counties$white))
             
             )
    })
      
  }
)
    