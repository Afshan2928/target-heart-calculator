Software Requirements Specification (SRS) for Target Heart Rate Calculator Shiny App
1. Introduction
1.1 Purpose

The Target Heart Rate Calculator Shiny App is a web-based application developed using Shiny (R programming language) that helps users calculate their target heart rate based on their age and gender. It also provides heart rate zones (fat burn, cardio, and peak), exercise recommendations, and links to educational resources related to target heart rate.
1.2 Scope
This app is designed for individuals seeking to optimize their fitness routines by working within their recommended target heart rate zones. The app calculates the target heart rate using the Karvonen Formula and provides visualization and educational information to improve user engagement.
1.3 Intended Audience

    Fitness enthusiasts looking to track and optimize their exercise intensity.

    Health professionals providing fitness guidance.

    Data scientists and R developers interested in health-related Shiny app development.

1.4 Definitions, Acronyms, and Abbreviations

    bpm: Beats per minute

    Shiny: An R package for building interactive web applications

    Karvonen Formula: A formula used to estimate the target heart rate for exercise based on age and gender.

2. Overall Description
2.1 Product Perspective

The app calculates the target heart rate range and heart rate zones for users based on two key inputs: age and gender. These results help users monitor their exercise intensity to maximize fat burning, cardiovascular health, and peak performance.
2.2 Product Features

    Target Heart Rate Calculation:

        Calculates the target heart rate range using the Karvonen formula.

        Provides the lower and upper heart rate limits based on user input.

    Heart Rate Zones:

        Calculates and displays heart rate zones:

            Fat Burn Zone (60-70% of max heart rate)

            Cardio Zone (70-85% of max heart rate)

            Peak Zone (85-100% of max heart rate)

    Visual Representation:

        A bar chart illustrating the target heart rate range.

    Exercise Recommendations:

        Displays a list of recommended exercises to help users stay within their target heart rate zones.

    Educational Resources:

        A hyperlink to an authoritative page on target heart rate and its significance for fitness.

2.3 Assumptions and Dependencies

    The app requires R and the Shiny package.

    The app uses the ggplot2 package for plotting heart rate ranges.

3. System Features
3.1 User Input

    Age: A numeric input for the user's age (18-100 years).

    Gender: A dropdown selection for gender (Male/Female).

3.2 Calculation of Target Heart Rate

    Formula for Maximum Heart Rate (MHR):

        For males: MHR = 220 - age

        For females: MHR = 226 - age

    Target Heart Rate Range:

        Lower Limit: 50% of the maximum heart rate.

        Upper Limit: 85% of the maximum heart rate.

3.3 Heart Rate Zones

    Fat Burn Zone: 60% to 70% of max heart rate.

    Cardio Zone: 70% to 85% of max heart rate.

    Peak Zone: 85% to 100% of max heart rate.

3.4 Outputs

    Target Heart Rate Range: The app displays the calculated lower and upper heart rate limits in beats per minute (bpm).

    Bar Chart: Displays a bar chart showing the target heart rate range.

    Heart Rate Zones: Text output showing the three heart rate zones.

    Exercise Recommendations: Text output listing recommended exercises.

    Educational Resource: A clickable link to an educational resource about target heart rate.

3.5 User Actions

    Calculate Button: When pressed, the app calculates the target heart rate range and heart rate zones.

    Reset Button: Resets all inputs and outputs to default values.

3.6 Error Handling

    Inputs outside the acceptable range (e.g., non-numeric age) should prompt users with an error message.

4. External Interface Requirements
4.1 User Interface

The user interface (UI) will be built using Shiny’s fluidPage layout with a sidebar for input fields and a main panel for displaying outputs. The design will be responsive and easy to navigate.
4.2 Hardware Interface

The app does not interact with any external hardware and runs entirely on the client-side using a web browser.
4.3 Software Interface

    R: The app requires R (version 4.0.0 or higher).

    Shiny: The app depends on the Shiny package for creating the web interface.

    ggplot2: Used to generate the bar chart.

4.4 Communications Interface

The app is a standalone web application and does not require any external communication systems.
5. Other Non-Functional Requirements
5.1 Performance Requirements

    The app should load and perform calculations within 2-3 seconds for all inputs.

5.2 Security Requirements

    The app does not handle sensitive data and therefore does not require advanced security measures.

5.3 Usability

    The UI should be intuitive, providing clear instructions and user-friendly design for ease of navigation.

5.4 Compatibility

    The app is compatible with modern browsers such as Google Chrome, Firefox, Safari, and Edge.

6. Appendices
6.1 Installation

To run the app locally, follow these steps:

    Install R from CRAN.

    Install Shiny and ggplot2 packages by running:

install.packages("shiny")
install.packages("ggplot2")

Clone or download the project from GitHub.

Run the app by executing the following in R:

    shiny::runApp('path_to_app')

6.2 References

    Heart Rate Zones: American Heart Association

    Shiny Documentation: Shiny - RStudio
