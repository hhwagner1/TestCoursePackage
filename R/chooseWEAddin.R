chooseWEAddin <- function() {

  ui <- miniUI::miniPage(
    miniUI::gadgetTitleBar("Choose Worked Example File"),
    miniUI::miniContentPanel(

      shiny::selectInput("type", "Choose a File Format:",
                  list("R Notebook in web browser (.nb.html)"=1,
                       "R markdown in RStudio (.Rmd)"=2,
                       "PDF file for printing (.pdf)"=3),
                  selected = 2
      ),
      shiny::selectInput("example", "Choose a Worked Example:",
                   list("Week 1: Importing Genetic Data"=1,
                        "Week 2: Spatial Data"=2,
                        "Week 2: Bonus Material"=3),
                  selected = 1
      )
    )
  )

  server <- function(input, output, session) {

    # Listen for 'done' events.
    shiny::observeEvent(input$done, {

      selectedFile <- paste0(c("WorkedExample_Week1",
                               "WorkedExample_Week2_short",
                               "Bonus_Week2")[as.numeric(input$example)],
                             c(".nb.html", ".Rmd", ".pdf")
                             [as.numeric(input$type)])

      utils::browseURL(paste0('file://',
                       system.file("WE", selectedFile,
                                   package = "TestCoursePackage")))

      cat(paste("Opening",selectedFile))
      shiny::stopApp()
    })

  }

  # We'll use a pane viwer, and set the minimum height at
  # 300px to ensure we get enough screen space to display the clock.
  viewer <- shiny::dialogViewer("Choose Worked Example",
                                width = 400, height = 600)
  shiny::runGadget(ui, server, viewer = viewer)

}
