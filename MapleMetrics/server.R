#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {

  # Reactive expression to generate the empty table
  sap_data <- reactive({
    if (is.null(input$n_runs) || input$n_runs < 1) return(NULL)
    data.frame(
      Date = as.Date(rep(NA, input$n_runs)),
      Volume = numeric(input$n_runs),
      Sap_Sugar_Concentration = numeric(input$n_runs),
      #Comments = text(input$n_runs),
      stringsAsFactors = FALSE
    )
  })
  
  output$sap_table <- renderRHandsontable({
    rhandsontable(sap_data(), rowHeaders = NULL)
  })
  

}
