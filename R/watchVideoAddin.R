watchVideoAddin <- function() {

  ui <- miniUI::miniPage(
    miniUI::gadgetTitleBar("Watch a Course Video"),
    miniUI::miniContentPanel(

      shiny::selectInput("video", "Select a Video:",
                   list("Week 1: Getting LG Data into R"=1,
                        "Week 2: Land Cover Analysis in R"=2),
                  selected = 1
      )
    )
  )

  server <- function(input, output, session) {

    # Listen for 'done' events.
    shiny::observeEvent(input$done, {

      selectedVideo <- c("http://sho.co/19BLE",
                         "http://sho.co/19COP")[as.numeric(input$video)]
      utils::browseURL(selectedVideo)

      cat(paste0("Opening ",selectedVideo, " in web browser.", "\n\n",
      "Hint: make video fullscreen by clicking on screen symbol on bottom right."))

      shiny::stopApp()
    })

  }

  viewer <- shiny::dialogViewer("Watch a Course Video",
                                width = 400, height = 600)
  shiny::runGadget(ui, server, viewer = viewer)

}
