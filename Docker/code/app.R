library("TestRShinyApp")
if ("data" %in% dir()) {
  homedir = paste0(getwd(), "/data") # cd to data directory
  setwd(homedir)
} else {
  homedir = getwd()
}
TestRShinyApp::myApp(homedir)