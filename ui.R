library(shiny)
shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Course project for Developing Data Products"),
        
        sidebarPanel(
            sliderInput('chick','Select chicks', value=c(1,10),min=1,max=50,step=1),
            checkboxInput('allChicks', 'Do you wish to see how all the chicks did?', value = FALSE),
            checkboxInput('showDiets', 'Do you wish to use colour to distinguish diets', value = FALSE)
        ),
        mainPanel(
            h2("Which Chick was the fattest after a given diet?"),
            p('This is a very basic app that shows the functionality of ShinyApp. It will try to demonstrate how you can interact with the app by changing some of the parameters and refreshing the content'),
            p('The app will show you dataset ChickWeigth from R which recorded how different chicks gained weight depending on what diet they had.'),
            p('Your job is to find the fattest chick at the end of experiment!'),
            h3('About this plot'),
            p('On the left side you will find a panel that enables you to select different chicks using the slider. You can select one or more chicks with the double slider.'),
            p('By selecting different chicks, the plot will change and show how a chicks weight changed over time. It is your job to find the fattest chick.'),
            p('You can also select the option to see how all chicks did in this experiment.'),
            p('In addition, if you wish, you can also colour the weight gain by different diets, so you see which diet was the most effective at getting the fattest chick.'),
            plotOutput('chicks')
        )
    )
)