library(shiny)
library(ggplot2)

# Define UI
ui <- fluidPage(
  titlePanel("Target Heart Rate Calculator"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("age", "Age:", value = 30, min = 18, max = 100),
      selectInput("gender", "Gender:", c("Male", "Female")),
      actionButton("calculate", "Calculate"),
      actionButton("reset", "Reset"),
      tags$hr(),
      helpText("Enter your age and gender to calculate your target heart rate."),
      h4("Exercise Recommendations:"),
      verbatimTextOutput("exercise_recommendations"),
      tags$hr(),
      h4("Educational Resources:"),
      tags$a(href = "https://www.heart.org/en/healthy-living/healthy-lifestyle/fitness/target-heart-rate", "Learn about Target Heart Rate")
    ),
    
    mainPanel(
      h4("Your Target Heart Rate Range:"),
      verbatimTextOutput("target_hr"),
      plotOutput("hr_plot"),
      h4("Heart Rate Zones:"),
      verbatimTextOutput("hr_zones")
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  observeEvent(input$calculate, {
    age <- input$age
    gender <- input$gender
    
    # Define constants for Karvonen formula
    if (gender == "Male") {  
      max_hr = 220 - age
    } else {
      max_hr = 226 - age
    }
    
    lower_hr <- 0.5 * max_hr
    upper_hr <- 0.85 * max_hr
    
    output$target_hr <- renderText({
      paste("Lower Limit:", round(lower_hr, 0), "bpm - Upper Limit:", round(upper_hr, 0), "bpm")
    })
    
# Create a plot for the target heart rate range
    output$hr_plot <- renderPlot({
      hr_data <- data.frame(
        Category = c("Lower Limit", "Upper Limit"),
        HeartRate = c(lower_hr, upper_hr)
      )
      
      ggplot(hr_data, aes(x = Category, y = HeartRate, fill = Category)) +
        geom_bar(stat = "identity") +
        ylim(0, max_hr) +
        labs(title = "Target Heart Rate Range", y = "Heart Rate (bpm)", x = "") +
        theme_minimal()
    })
    
# Calculate heart rate zones
    fat_burn_zone <- c(lower_hr * 0.6, lower_hr * 0.7)
    cardio_zone <- c(lower_hr * 0.7, upper_hr * 0.85)
    peak_zone <- c(upper_hr * 0.85, upper_hr)
    
    output$hr_zones <- renderText({
      paste("Fat Burn Zone: ", round(fat_burn_zone[1], 0), "bpm -", round(fat_burn_zone[2], 0), "bpm\n",
            "Cardio Zone: ", round(cardio_zone[1], 0), "bpm -", round(cardio_zone[2], 0), "bpm\n",
            "Peak Zone: ", round(peak_zone[1], 0), "bpm -", round(peak_zone[2], 0), "bpm")
    })
    
# Provide exercise recommendations
    output$exercise_recommendations <- renderText({
      paste("For optimal results, aim for activities that keep your heart rate in the target range. Recommended exercises include:\n",
            "- Jogging\n",
            "- Cycling\n",
            "- Swimming\n",
            "- Aerobics\n",
            "- High-Intensity Interval Training (HIIT)")
    })
  })
  
  observeEvent(input$reset, {
    updateNumericInput(session, "age", value = 30)
    updateSelectInput(session, "gender", selected = "Male")
    output$target_hr <- renderText("")
    output$hr_plot <- renderPlot(NULL)
    output$hr_zones <- renderText("")
    output$exercise_recommendations <- renderText("")
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
