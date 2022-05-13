# install.packages("foreach")
library(foreach)

# foreach 함수
foreach(i = 1:5) %do% {
  return(i)
}

foreach(i = 1:5, .combine = c) %do% {
  return(i)
}
foreach(i = 1:5, .combine = rbind) %do% {
  return(data.frame(val = i))
}
foreach(i = 1:5, .combine = cbind) %do% {
  return(data.frame(val = i))
}

foreach(i = 1:10, .combine = '+') %do% {
  return(i)
}

# install.packages("doParallel")
library(doParallel)

# install.packages("plyr")
library(plyr)

# registerDoParallel 함수
registerDoParallel(cores = 4)

big_data <- data.frame(
  value = runif(NROW(LETTERS) * 2000000),
  group = rep(LETTERS, 2000000)
)

dlply(big_data, .(group), function(x){
  mean(x$value)
}, .parallel=TRUE)

registerDoParallel(cores = 4)

big_data <- data.frame(
  value = runif(NROW(LETTERS) * 2000000),
  group = rep(LETTERS, 2000000)
)

foreach(i=1:800000) %dopar% {
  mean(big_data$value + i)
}

foreach(ntree = c(10, 20, 30, 100, 1000)) %dopar% {
  build_model(big_data, ntree= ntree)
}

# install.packages("testthat")
library(testthat)

# expect 함수들
a <- 1:3
b <- 1:3
expect_equal(a, b)
expect_equivalent(a, b)
names(a) <- c('a', 'b', 'c')
expect_equal(a, b)
expect_equivalent(a, b)

fib <- function(n) {
  if (n == 0) {
    return(1)
  }
  if (n > 0) {
    return(fib(n - 1) + fib(n - 2))
  }
}
expect_equal(1, fib(0))
expect_equal(1, fib(1))

# test_that 함수
fib <- function(n) {
  if (n == 0 || n == 1) {
    return(1)
  }
  if (n >= 2) {
    return(fib(n - 1) + fib(n - 2))
  }
}

test_that("base case", {
  expect_equal(1, fib(0))
  expect_equal(1, fib(1))
})

test_that("recursion case", {
  expect_equal(2, fib(2))
  expect_equal(3, fib(3))
  expect_equal(5, fib(4))
})

source("run_tests.R")

# print 함수
paste('a', 1, 2, 'b', 'c')

paste("A", 1:6)

paste("A", 1:6, sep = "")
paste0("A", 1:6)

paste("A", 1:6, sep = "", collapse = ",")

fibo <- function(n) {
  if (n == 1 || n == 2) {
    print("base case")
    return(1)
  }
  print(paste0("fibo(", n - 1, ") + fibo(", n - 2, ")"))
  return(fibo(n - 1) + fibo(n - 2))
}

fibo(1)
fibo(2)
fibo(3)

# sprintf 함수
sprintf("%d", 123)
sprintf("Number : %d", 123)
sprintf("Number : %d, String : %s", 123, "Hello")

sprintf("%.2f", 123.456)

sprintf("%5d", 123)
sprintf("%5d", 1234)
sprintf("%5d", 12345)
sprintf("%5d", 123456)

print("hi")
cat("hi")
cat(1, 2, 3, 4, 5, "\n")

sum_to_ten <- function() {
  sum <- 0
  cat("Adding ...")
  for (i in 1:10) {
    sum <- sum + i
    cat(i, "...")
  }
  cat("Done!", "\n")
  return(sum)
}
sum_to_ten()

# browser 함수
sum_to_ten <- function() {
  sum <- 0
  for (i in 1:10) {
    sum <- sum + i
    if (i >= 5) {
      browser()
    }
  }
  return(sum)
}

sum_to_ten()

# install.packages("plyr")
library(plyr)

ddply(iris, .(Species), function(rows) { browser() })

# system.time 함수
sum_to_n <- function(n) {
  sum <- 0
  for (i in 1:n) {
    sum <- sum + i
  }
  return(sum)
}

system.time(sum_to_n(10000))
system.time(sum_to_n(100000))
system.time(sum_to_n(1000000))

x <- matrix(1:(10000*10000), ncol = 10000)
system.time(save(x, file = "x.RData"))
system.time(load(file = "x.RData"))

# Rprof 함수
add_one <- function(val) {
  return(val + 1)
}

add_one_to_vec <- function(x) {
  for (i in seq_along(x)) {
    x[i] <- add_one(x[i])
  }
  return(x)
}

Rprof("add_one.out")
x <- add_one_to_vec(1:1000000)     
head(x)
Rprof(NULL)

# summaryRprof 함수
summaryRprof("add_one.out")
summaryRprof("add_one.out")$by.self 
# self.time : 각 함수가 수행하는 데 걸린 시간
# self.pct : 전체 수행 시간 대비 각 함수의 self.time 시간 비율
# total.time : 자기 함수 + 실행한 다른 함수 시간