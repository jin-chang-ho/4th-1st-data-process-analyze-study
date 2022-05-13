context("fibonacci series")

test_that("base test", {
  expect_equal(1, fibo(0))
  expect_equal(1, fibo(1))
})

test_that("recursion test", {
  expect_equal(2, fibo(2))
  expect_equal(3, fibo(3))
  expect_equal(5, fibo(4))
  expect_equal(0, fibo(5)) # 에러를 부르기 위한 코드
})
