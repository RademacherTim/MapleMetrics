#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(rhandsontable)
library(lubridate)


# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Maple Metrics"),

    tabsetPanel(
      tabPanel("General", 
               h3("General Information"),
               
               radioButtons("country", "Country:",
                            choices = c("Canada", "USA"),
                            selected = "USA",
                            inline = TRUE),
               
               numericInput("year", "Year", value = lubridate::year(Sys.Date())),
               numericInput("n_taps", "Number of taps", value = 1000),
               numericInput("area", HTML("<p>Surface (m<sup>2</sup>)</p>"), value = 1000),
               numericInput("vac", "Vacuum level (\"Hg)", value = 1000)
      ),
      
      tabPanel("Season calendar", 
               h3("Season dates"),
               
               dateInput("tapping_start", 
                         label = "Tapping started", 
                         value = "2025-03-01", 
                         format = "yyyy-mm-dd",
                         startview = "month",
                         weekstart = 1,
                         language = "en"),
               
               dateInput("tapping_end", 
                         label = "Tapping finished", 
                         value = "2025-03-02", 
                         format = "yyyy-mm-dd",
                         startview = "month",
                         weekstart = 1,
                         language = "en"),
               
               dateInput("boil_date", 
                         label = "First boil", 
                         value = "2025-03-06", 
                         format = "yyyy-mm-dd",
                         startview = "month",
                         weekstart = 1,
                         language = "en"),
               
               dateInput("untapping_start", 
                         label = "Untapping started", 
                         value = "2025-05-01", 
                         format = "yyyy-mm-dd",
                         startview = "month",
                         weekstart = 1,
                         language = "en"),
               
               dateInput("untapping_end", 
                         label = "Untapping finished", 
                         value = "2025-05-01", 
                         format = "yyyy-mm-dd",
                         startview = "month",
                         weekstart = 1,
                         language = "en"),
               
               ),
               
      tabPanel("Sap runs", 
               h3("Enter sap run data"),
               numericInput("n_runs", "Number of sap runs:", value = 15),
               rHandsontableOutput("sap_table")
               ),
      
      tabPanel("Syrup data", 
               h3("Enter sap run data"),
               numericInput("n", "Number of sap runs:", value = 1),
               #rHandsontableOutput("sap_table")
               ),
    )
)
