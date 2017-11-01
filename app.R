setwd("~/R")

shinyApp(
  
  ui = fluidPage(
    
      useShinyjs(),
      
      titlePanel("My Shiny App - edit version"),
      
      fluidRow(
        
        column(3,
               h3("Buttons"),
               actionButton("action", "Action"),
               br(),
               br(), 
               submitButton("Submit")),
        
        column(3,
               h3("Single checkbox"),
               checkboxInput("checkbox", "Choice A", value = TRUE)),
        
        column(3, 
               checkboxGroupInput("checkGroup", 
                                  h3("Checkbox group"), 
                                  choices = list("Choice 1" = 1, 
                                                 "Choice 2" = 2, 
                                                 "Choice 3" = 3),
                                  selected = 1)),
        
        column(3, 
               dateInput("date", 
                         h3("Date input"), 
                         value = "2014-01-01"))   
      ),
      
      sidebarLayout(position = "right",
                    sidebarPanel("sidebar panel"),
                    mainPanel(
                      "main panel",
                      h6("Episode IV", align = "center"),
                      h6("A NEW HOPE", align = "center"),
                      img(src = "http://mlb.mlb.com/mlb/images/players/head_shot/545361.jpg", height = 140, width = 100)
                      )
      ),

        
      tags$head(tags$script(src="https://public.tableau.com/javascripts/api/tableau-2.js")),
      
      extendShinyjs(text = "
                    shinyjs.init = function(){
                    var containerDiv = document.getElementById('vizContainer');

                    var options = {
                      width: 500,
                      height: 400,
                      hideTabs: true,
                      hideToolbar: false,
                    };  
                    url = 'https://public.tableau.com/views/HittingRobot/MetricsDash?:embed=y&:display_count=yes&publish=yes';
                    var viz = new tableau.Viz(containerDiv, url,options); 
                    }"),
      
        
      tags$div(id = 'vizContainer')
      ),
  
  server = function(input, output, session){
    js$init()
    }
  
  )


