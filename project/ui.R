library(shiny)

# Load the 'datasets' package which contains 'VADeaths' dataset
library(datasets)

# Define the overall UI
shinyUI(
    
    # Use a fluid Bootstrap layout
    fluidPage(    
        
        # Give the page a title
        titlePanel("Death Rate Analysis in Virginia at 1940 by Population Group"),
        
        # Generate a row with a sidebar
        sidebarLayout(      
            
            # Define the sidebar with input to select the population group
            sidebarPanel(
                selectInput("population_group", "Population Group:", choices=colnames(VADeaths)),
                hr(),
                helpText("Death Rates in Virginia in 1940 by age group on the selected population group."),
                hr(),
                helpText("Choosing the population group you can see the death rate per 1000 population for every
                         age group in Virginia in 1940. You can also see the total death population of
                         the chosen group and the percentage."),
                hr(),
                helpText("Source code can be found at https://github.com/stavoikono/developing-data-products")
            ),
            
            # Create a spot for the barplot
            mainPanel(
                plotOutput("deathPlot"),
                h3('Total Death of the population group'),
                verbatimTextOutput("prediction"),
                h3('Proportion of death per group'),
                verbatimTextOutput("prop")
            )
            
        )
    )
)