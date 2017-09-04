startTutorialAddin <- function() {
  require(swirl)
  install_course_directory("Landscape_Genetic_Data_Analysis_with_R.swc")
#  install_course_directory('system.file("extdata",
#                           "Landscape_Genetic_Data_Analysis_with_R.swc",
#                           package = "TestCoursePackage")')


  cat("To start a tutorial:","\n",
      "- type: swirl()", "\n",
      "- follow prompts", "\n",
      "- select course and tutorial","\n",
      "- to exit, type: bye()","\n",
      "- to restart tutorial, use a different name", "\n",
      "  (best add a number, like this: 'MyName2')")
}


