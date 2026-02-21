install_and_load <- function(package_name) {
  user_lib <- Sys.getenv("R_LIBS_USER")
  if (!dir.exists(user_lib)) {
    dir.create(user_lib, recursive = TRUE)
  }

  if (!require(package_name, character.only = TRUE)) {
    install.packages(package_name, dependencies = TRUE, repos = "http://cran.r-project.org", lib = user_lib)
  }

  library(package_name, character.only = TRUE, lib.loc = user_lib)
}