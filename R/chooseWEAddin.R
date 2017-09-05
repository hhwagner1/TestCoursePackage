library(shiny)
library(miniUI)

# We'll wrap our Shiny Gadget in an addin.
# Let's call it 'chooseWEAddin()'.
chooseWEAddin <- function() {
  
  # Our ui will be a simple gadget page, which
  # simply displays the time in a 'UI' output.
  ui <- miniPage(
    gadgetTitleBar("Choose Worked Example File"),
    miniContentPanel(

      selectInput("type", "Choose a File Format:",
                  list("R Notebook in web browser (.nb.html)"=1, 
                       "R markdown in RStudio (.Rmd)"=2,
                       "PDF file for printing (.pdf)"=3)
      ),
      selectInput("example", "Choose a Worked Example:",
                   list("Week 1: Importing Genetic Data"=1, 
                        "Week 2: Spatial Data"=2, 
                        "Week 2: Bonus Material"=3)
      )
    )
  )
  
  server <- function(input, output, session) {

    
    
    # Listen for 'done' events. 
    observeEvent(input$done, {

      selectedFile <- paste0(c("WorkedExample_Week1",
                               "WorkedExample_Week2_short",
                               "Bonus_Week2")[as.numeric(input$example)], 
                             c(".nb.html", ".Rmd", ".pdf")
                             [as.numeric(input$type)])

      browseURL(paste0('file://', file.path(getwd(), selectedFile)))

      cat(paste("Opening",selectedFile))
      stopApp()
    })
    
  }
  
  # We'll use a pane viwer, and set the minimum height at
  # 300px to ensure we get enough screen space to display the clock.
  viewer <- dialogViewer("chooseWE", width = 400, height = 600)
  runGadget(ui, server, viewer = viewer)
  
}

# Try running the clock!
chooseWEAddin()


# Now all that's left is sharing this addin -- put this function
# in an R package, provide the registration metadata at
# 'inst/rstudio/addins.dcf', and you're ready to go!
