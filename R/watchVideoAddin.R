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
      if(as.numeric(input$type) != 1) {
        switch(input$video,
               "1" = utils::download.file("https://github.com/hhwagner1/DGS_LG_Labs/raw/master/docs/Video_slides/Week1_Slides.pdf",
                     destfile="Week1_Slides.pdf", method="libcurl"),
               "2" = utils::download.file("https://github.com/hhwagner1/DGS_LG_Labs/raw/master/docs/Video_slides/Week2_Slides.pdf",
                     destfile="Week2_Slides.pdf", method="libcurl"))

        switch(input$video,
               "1" = utils::browseURL("Week1_Slides.pdf"),
               "2" = utils::browseURL("Week2_Slides.pdf"))
      }

      cat(paste0("Video location: ",selectedVideo, "\n\n",
      "Hints:
- Videos open in your default web browser.
- Make video fullscreen by clicking on screen symbol (bottom right).
- Slides open in your default PDF viewer.
- Slides are saved to your active working directory."))

      shiny::stopApp()
    })

  }

  viewer <- shiny::dialogViewer("Watch a Course Video",
                                width = 400, height = 600)
  shiny::runGadget(ui, server, viewer = viewer)

}
