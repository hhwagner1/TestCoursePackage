watchVideoAddin <- function() {

  ui <- miniUI::miniPage(
    miniUI::gadgetTitleBar("Watch a Course Video"),
    miniUI::miniContentPanel(

      shiny::selectInput("type", "What do you want to open?",
                         list("Video only (in web browser)"=1,
                              "Slides only (as PDF)"=2,
                              "Video and slides"=3),
                         selected = 1
      ),
      shiny::selectInput("video", "Select a Topic:",
                   list("Week 1: Getting LG Data into R"=1,
                        "Week 2: Land Cover Analysis in R"=2),
                  selected = 1
      )
    )
  )

  server <- function(input, output, session) {

    # Listen for 'done' events.
    shiny::observeEvent(input$done, {

      selectedVideo <- c("http://sho.co/19DCV",
                         "http://sho.co/19DA2")[as.numeric(input$video)]

      selectedSlides <- c("Week1_Slides.pdf",
                          "Week2_Slides.pdf")[as.numeric(input$video)]
      if(as.numeric(input$type) != 2) utils::browseURL(selectedVideo)
      if(as.numeric(input$type) != 1) utils::browseURL(paste0('file://',
                    system.file("Slides", selectedSlides,
                                 package = "TestCoursePackage")))

      cat(paste0("Opening ",selectedVideo, " and slides in web browser.", "\n\n",
      "Hints:
      - Videos will open in your default web browser.
      - Slides will open in your default app for PDF files.
      - Make the video fullscreen by clicking on screen symbol on bottom right."))

      shiny::stopApp()
    })

  }

  viewer <- shiny::dialogViewer("Watch a Course Video",
                                width = 400, height = 600)
  shiny::runGadget(ui, server, viewer = viewer)

}
