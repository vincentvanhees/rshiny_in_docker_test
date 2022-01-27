#' myApp
#'
#' @param homedir character to specify home directory
#' @param ... No input needed, function runs the app
#' @return no object is returned, just an app
#' @import shiny
#' @export
# TestRShinyApp::myApp(homedir="~")
# roxygen2::roxygenise()
myApp <- function(homedir=getwd(), ...) {
  ui <- fluidPage(
    actionButton("save", "Save dummy file to mounted volume"),
    textOutput("message")
  )
  server <- function(input, output, session) {
    observeEvent(input$save, {
      # First check access permissions of directory
      cat("\n Check access with R function file.access for ",homedir)
      cat("\n Coding: succes -> 0, failure -> -1)")
      for (mode in c(0, 4, 2, 1)) {
        cat("\n mode ",mode, "result: ", file.access(homedir, mode = mode))
      }
      # Now write file to directory
      file = paste0(homedir, "/dummy_file_you_can_delete_me.txt")
      output$message <- renderText({paste0("Trying to save ", file)})
      write("abc", file = file, append = TRUE)
      if (file.exists(file)) {
        output$message <- renderText({paste0("Object has successfully been stored to ", file)})
      } else {
        output$message <- renderText({paste0("Saving to file failed (", file, ")")})
      }
    })
  }
  # Run the application 
  shinyApp(ui, server)
}