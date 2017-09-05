startTutorialAddin <- function() {
#  swirl::install_course_directory("Landscape_Genetic_Data_Analysis_with_R.swc")
#  install_course_directory('system.file("extdata",
#                           "Landscape_Genetic_Data_Analysis_with_R.swc",
#                           package = "TestCoursePackage")')
  path <- system.file('swirl/Landscape_Genetic_Data_Analysis_with_R.swc', package='TestCoursePackage')
#  swirl::install_course_directory(path)

  cat("To start a tutorial:","\n",
      "- type: require(swirl)", "\n",
      "- type: swirl()", "\n",
      "- follow prompts", "\n",
      "- select course and tutorial","\n\n")
#  cat("- to exit, type: bye()","\n",
#      "- to resume, type: swirl()","\n",
#      "- to restart tutorial, use a different name", "\n",
#      "  (best add a number, like this: 'MyName2')")
}


