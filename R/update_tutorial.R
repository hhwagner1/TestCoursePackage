update_tutorial <- function (course_name)
{
  path <- file.path(swirl_courses_dir(), make_pathname(course_name))
  if (file.exists(path)) {
    unlink(path, recursive = TRUE, force = TRUE)
    #message(s() %N% "Course uninstalled successfully!")
  }
  else {
    #stop(s() %N% "Course not found!")
  }
  invisible()
}
<environment: namespace:swirl>
