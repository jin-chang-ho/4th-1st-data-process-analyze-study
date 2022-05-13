# 조건문
if (TRUE) {
  print("TRUE")
  print("hello")
} else {
  print("FALSE")
  print("world")
}

x <- c(1, 2, 3, 4, 5)
ifelse(x %% 2 == 0, "even", "odd")

# 반복문
for (i in 1:10) {
  print(i)
}

i <- 1
while (i <= 10) {
  print(i)
  i <- i + 1
}

i <- 0
while (i <= 9) {
  i <- i + 1
  if (i %% 2 != 0) {
      next
  }
  print(i)
}

i <- 1
repeat {
  print(i)
  if (i >= 10) {
    break
  }
  i <- i + 1
}

# 벡터 연산
1:5 * 2 + 1

x <- c(1, 2, 3, 4, 5)
x + 1

x <- c(1, 2, 3, 4, 5)
x + x
x == x
x == c(1, 2, 3, 4, 5)
c(T, T, T) & c(T, F, T)

x <- c(1, 2, 3, 4, 5)
sum(x)
mean(x)
median(x)

x <- c(1, 2, 3, 4, 5)
ifelse(x %% 2 == 0, "even", "odd")

(d <- data.frame(x = c(1, 2, 3, 4, 5), y = c("a", "b", "c", "d", "e")))
d[c(TRUE, FALSE, TRUE, FALSE, TRUE),]

d[d$x %% 2 == 0, ]

# NA의 처리
NA & TRUE
NA + 1

sum(c(1, 2, 3, NA))
sum(c(1, 2, 3, NA), na.rm = TRUE)

(x <- data.frame(a = c(1, 2, 3), b = c("a", NA, "C"), c = c("a", "b", NA)))
na.fail(x)
na.omit(x)
na.exclude(x)
na.pass(x)

# 함수 정의
fibo <- function(n) {
  if (n == 1 || n == 2) {
    return(1)
  }
  return(fibo(n - 1) + fibo(n - 2))
}
fibo(1)
fibo(5)

f <- function(x, y) {
  print(x)
  print(y)
}
f(1, 2)
f(y = 1, x = 2)

# 가변 길이 인자
f <- function(...) {
  args <- list(...)
  for (a in args) {
    print(a)
  }
}
f('3', '4')

f <- function(x, y) {
  print(x)
  print(y)
}
g <- function(z, ...) {
  print(z)
  f(...)
}
g(1, 2, 3)

f <- function(x, y) {
  print(x)
  g <- function(y) {
    print(y)
  }
  g(y)
}
f(1, 2)

f <- function(x1) {
  return(function(x2) {
    return(x1 + x2)
  })
}

g <- f(1)
g(2)
g2 <- f(2)
g2(2)

# 변수의 범위
n <- 1
f <- function() {
  print(n)
}
f()
n <- 2
f()

n <- 100
f <- function() {
  n <- 1
  print(n)
}
f()

rm(list = ls())
f <- function() {
  print(n)
}
f()

rm(list = ls())
f <- function() {
  n <- 1
}
f()
n

n <- 100
f <- function(n) {
  print(n)
}
f(1)

f <- function(x) {
  a <- 2
  g <- function(y) {
    print(y + a)
  }
  g(x)
}
f(1)

a <- 100
f <- function(x) {
  g <- function(y) {
    print(y + a)
  }
  g(x)
}
f(1)

f <- function() {
  a <- 1
  g <- function() {
    a <- 2
    print(a)
  }
  g()
  print(a)
}
f()

b <- 0
f <- function() {
  a <- 1
  g <- function() {
    a <<- 2
    b <<- 2
    print(a)
    print(b)
  }
  g()
  print(a)
  print(b)
}
f()

# 값에 의한 전달
f <- function(df2) {
  df2$a <- c(1, 2, 3)
}
df <- data.frame(a = c(4, 5, 6))
f(df)
df

f <- function(df) {
  df$a <- c(1, 2, 3)
  return(df)
}
df <- data.frame(a = c(4, 5, 6))
df <- f(df)
df

# 객체의 불변성
a <- list()
tracemem(a)
a$b <- c(1, 2, 3)
untracemem(a)

v <- 1:1000
for (i in 1:1000) {
  v[i] <- v[i] + 1
}

v <- 1:1000
v <- v + 1

rm(list = ls())
gc()
v <- 1:99999999
for (i in 1:99999999) {
  for (j in 1:99999999) {
    v[j] <- v[j] + 1
  }
}

# 큐
q <- c()
q_size <- 0

enqueue <- function(data) {
  q <<- c(q, data)
  q_size <<- q_size + 1
}  

dequeue <- function() {
  first <- q[1]
  q <<- q[-1]
  q_size <<- q_size - 1
  return(first)
}

size <- function() {
  return(q_size)
}

enqueue(1)
enqueue(3)
enqueue(5)
print(size())
print(dequeue())
print(dequeue())
print(dequeue())
print(size())

# 큐 모듈
enqueue(1)
q <- c(q, 5) # 외부 접근 가능 문제점
print(size())
dequeue()
dequeue()
size()

queue <- function() {
  q <- c()
  q_size <- 0
  
  enqueue <- function(data) {
    q <<- c(q, data)
    q_size <<- q_size + 1
  }  
  
  dequeue <- function() {
    first <- q[1]
    q <<- q[-1]
    q_size <<- q_size - 1
    return(first)
  }
  
  size <- function() {
    return(q_size)
  }
  
  return(list(enqueue = enqueue, dequeue = dequeue, size = size))
}

q <- queue()
q$enqueue(1)
q$enqueue(3)
q$size()
q$dequeue()
q$dequeue()
q$size()

q <- queue()
r <- queue()
q$enqueue(1)
r$size()
r$enqueue(3)
q$dequeue()
r$dequeue()
q$size()
r$size()