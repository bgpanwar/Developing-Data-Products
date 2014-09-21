library(shiny)
library(ggplot2)

# read a dataset aggregated by state produced from the NOAA storm data set
stormdata <- read.table("total.cost.bystate.txt", header=T, sep = ",")

# Define a server for the Shiny app
shinyServer(
  function(input, output) {
  
  # Fill in the spot we created for a plot
  output$stormPlot <- renderPlot({

    # Get the top ten most costly weather events for the input state
    stateData <- stormdata[stormdata$STATE == input$state,]
    top10 <- stateData[order(-stateData$PROPDMG),][1:10,]
    
    plot1 <- ggplot(data=top10, aes(x=reorder(EVTYPE,PROPDMG), y=PROPDMG)) + geom_bar(stat="identity",color="cyan") + coord_flip() + 
      ggtitle("Total Property Damage due to Event Type ") + xlab("Top Ten Event Type") + ylab("Cost amount in Dollars")
    print(plot1)
  })
})
