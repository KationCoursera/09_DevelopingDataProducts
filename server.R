library(shiny)
library(UsingR)
data(ChickWeight)

shinyServer(
    function(input,output) {
        
        ChickWeight$Chick <- as.numeric(levels(ChickWeight$Chick)[ChickWeight$Chick])
        
        chick_data <- reactive({
            if(input$allChicks == FALSE) {
                chick_data <- ChickWeight[ChickWeight$Chick >= input$chick[1] & ChickWeight$Chick <= input$chick[2],]
            } else {
                chick_data <- ChickWeight
            }
        })
        
        chick_text <- reactive({
            if(input$allChicks == FALSE) {
                if (input$chick[1] == input$chick[2]) {
                    chick_text <- paste("Chick: ",input$chick[1])
                } else {
                    chick_text <- paste("Chicks: ",input$chick[1],"-",input$chick[2])
                }
            } else {
                chick_text <- "Chicks 1-50"
            }
        })
        
        output$chicks <- renderPlot(function() {
            my_data <- chick_data()
            
            if(input$showDiets == FALSE) {
                q <- ggplot(my_data, aes(x=Time, y=weight), ylab='Weigth', xlab='Time', title="Chicks!") +
                    geom_point() + annotate("text",2,380,label=chick_text())
                    
            } else {
                q <- ggplot(my_data, aes(x=Time, y=weight, color=Diet), ylab='Weigth', xlab='Time', title="Chicks!") +
                    geom_point() + annotate("text",2,380,label=chick_text())
                   
            }
            
            print(q)
        })
    }
)