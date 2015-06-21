library(shiny)
shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Diabetes prediction"),
       
        sidebarPanel(
            numericInput("glucose","Glucose mg/dl",90,min=50,max=200,step=5),
            submitButton('Submit')
            #checkboxGroupInput("id2", "Checkbox",
            #                   c("value 1" = "1",
            #                     "value 2" = "2",
            #                     "value 3" = "3")
            #                   ),
            #dateInput("date", "Date:")
        ),
        mainPanel(
            h3('Results of prediction'),
            h4('You entered'),
            verbatimTextOutput('inputValue'),
            h4('Which resulted in a prediction of '),
            verbatimTextOutput('prediction')
            
        )
    )
)