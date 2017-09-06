startTutorialAddin <- function() {
#  swirl::install_course_directory("Landscape_Genetic_Data_Analysis_with_R.swc")
#  install_course_directory('system.file("extdata",
#                           "Landscape_Genetic_Data_Analysis_with_R.swc",
#                           package = "TestCoursePackage")')
  # path <- system.file('swirl/Landscape_Genetic_Data_Analysis_with_R.swc',
  #                     package='TestCoursePackage')

  #path <- system.file("swirl", "Landscape_Genetic_Data_Analysis_with_R.swc",
  #            package = "TestCoursePackage")
  #swirl::install_course_directory(path)

  swirl::install_course_dropbox("https://www.dropbox.com/s/2vxdiyg7fn9r2mb/Landscape_Genetic_Data_Analysis_with_R.swc.zip?dl=0")

  #install_course_github("hhwagner1", "Landscape_Genetics_R_Course")

  cat("\n","To start a tutorial:","\n",
      "- type: require(swirl)", "\n",
      "- type: swirl()", "\n",
      "- follow prompts", "\n",
      "- select course and tutorial","\n\n")

  cat("To stop and resume a tutorial:","\n",
      "- to stop and exit swirl, type: bye()","\n",
      "- to resume where you stopped, type: swirl()","\n\n")

  cat("To restart tutorial from beginning:","\n",
      "- type: swirl()","\n",
      "- use a different name", "\n",
      "  (simply add a number, like this: 'MyName2')")
}


