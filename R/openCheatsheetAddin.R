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

    switch(input$sheet,
           "1" = utils::download.file(paste0('file://',
                 system.file("extdata", "RCommands.doc",
                 package = "/TestCoursePackage")), destfile="RCommands.doc",
                 method="libcurl"),
           "2" = utils::download.file("https://github.com/rstudio/cheatsheets/raw/master/source/pdfs/base-r.pdf",
                 destfile="/base-r.pdf", method="libcurl"),
           "3" = utils::download.file("https://github.com/rstudio/cheatsheets/raw/master/source/pdfs/rmarkdown-cheatsheet-2.0.pdf",
                 destfile="/rmarkdown-cheatsheet-2.0.pdf", method="libcurl"),
           "4" = utils::download.file("https://github.com/rstudio/cheatsheets/raw/master/source/pdfs/data-import-cheatsheet.pdf", destfile="/data-import-cheatsheet.pdf", method="libcurl"),
           "5" = utils::download.file("https://github.com/rstudio/cheatsheets/raw/master/source/pdfs/data-transformation-cheatsheet.pdf",
                 destfile="/data-transformation-cheatsheet.pdf", method="libcurl"),
           "6" = utils::download.file("https://github.com/rstudio/cheatsheets/raw/master/source/pdfs/ggplot2-cheatsheet-2.1.pdf",
                 destfile="/ggplot2-cheatsheet-2.1.pdf", method="libcurl"))

    selectedSheet <- switch(input$sheet,
        "1" = utils::browseURL("RCommands.doc"),
        "2" = utils::browseURL("base-r.pdf"),
        "3" = utils::browseURL("rmarkdown-cheatsheet-2.0.pdf"),
        "4" = utils::browseURL("data-import-cheatsheet.pdf"),
        "5" = utils::browseURL("data-transformation-cheatsheet.pdf"),
        "6" = utils::browseURL("ggplot2-cheatsheet-2.1.pdf"))

    cat(paste0("Hints:
- Files are saved to your active working directory.
- Old files will be overwritten.
- 'List of R Functions by Tutorial' will open as Word file (doc).
- Add your notes and save under a new name!
- All other cheat sheets will open in your default PDF viewer.
"))


      shiny::stopApp()
    })

  }

  viewer <- shiny::dialogViewer("Open a Cheat Sheet",
                                width = 400, height = 400)
  shiny::runGadget(ui, server, viewer = viewer)

}
