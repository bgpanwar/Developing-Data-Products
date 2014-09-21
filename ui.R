library(shiny)

# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Storm Property Damage by State"),
    verticalLayout(    
      # Generate a row with a sidebar
      sidebarLayout(      
      
        # Define the sidebar with one input
        sidebarPanel(
          selectInput("state", "State:", 
                    choices=state.abb),
          hr(),
          helpText("Data from NOAA storm system")
        ),
      
        # Create a spot for the barplot
        mainPanel(
          plotOutput("stormPlot")  
        )
      
      ),
      mainPanel("This app displays the top ten storm event types and their property damage for the state selected by the user")
    )
  )
)
