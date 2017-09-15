openCheatsheetAddin <- function() {

  ui <- miniUI::miniPage(
    miniUI::gadgetTitleBar("Open Cheat Sheet"),
    miniUI::miniContentPanel(

      shiny::selectInput("sheet", "Select a Cheat Sheet:",
                   list("List of R Functions by Tutorial (doc)"=1,
                        "Base R"=2,
                        "R Markdown Language"=3,
                        "Data Import"=4,
                        "Data Transformation with dplyr"=5,
                        "Data Visualization with ggplot2"=6),
                  selected = 1
      )
    )
  )

  server <- function(input, output, session) {

    # Listen for 'done' events.
    shiny::observeEvent(input$done, {


      selectedSheet <- c(paste0('file://',
                                system.file("extdata", "RCommands.doc",
                                            package = "TestCoursePackage")),
          "https://github.com/rstudio/cheatsheets/blob/master/source/pdfs/base-r.pdf",
          "https://github.com/rstudio/cheatsheets/blob/master/source/pdfs/rmarkdown-cheatsheet-2.0.pdf",
          "https://github.com/rstudio/cheatsheets/blob/master/source/pdfs/data-import-cheatsheet.pdf",
          "https://github.com/rstudio/cheatsheets/blob/master/source/pdfs/data-transformation-cheatsheet.pdf",
          "https://github.com/rstudio/cheatsheets/blob/master/source/pdfs/ggplot2-cheatsheet-2.1.pdf")[as.numeric(input$sheet)]
      utils::browseURL(selectedSheet)


      cat(paste0("Opening ",selectedSheet, " in web browser.", "\n\n",
      "Hint: download and save the file locally."))

      shiny::stopApp()
    })

  }

  viewer <- shiny::dialogViewer("Open a Cheat Sheet",
                                width = 400, height = 400)
  shiny::runGadget(ui, server, viewer = viewer)

}
