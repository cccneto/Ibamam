if (system.file(package = "curl") == "") {
  install.packages("curl")
}

library(testthat)
library(Ibamam)
library(curl)

test_check("Ibamam")
