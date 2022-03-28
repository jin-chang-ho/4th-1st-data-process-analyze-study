require(testthat) # library랑 동일한 기능
source("fibo.R") # fibo.R 실행

test_dir("tests", reporter = "summary")
