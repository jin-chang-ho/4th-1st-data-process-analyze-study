# iris data
head(iris)
str(iris)

iris3

library(help=datasets)

data(mtcars)
head(mtcars)
?mtcars
help(mtcars)

# csv 파일 입출력
(x <- read.csv("a.csv", stringsAsFactors = TRUE))
str(x)

(x <- read.csv("b.csv", stringsAsFactors = TRUE, header = FALSE))
names(x) <- c("id", "name", "score")
x
str(x)
x$name <- as.character(x$name)
str(x)

x <- read.csv("a.csv", stringsAsFactors = FALSE)
str(x)

(x <- read.csv("c.csv", stringsAsFactors = TRUE))
str(x)

x <- read.csv("c.csv", na.strings = c("NIL"))
str(x)
is.na(x$score)

x <- read.csv("a.csv", stringsAsFactors = FALSE)
write.csv(x, "d.csv", row.names = FALSE)
write.csv(x, "e.csv")

# 객체의 파일 입출력
x <- 1:5
y <- 6:10
save(x, y, file = "xy.RData")

rm(list = ls())
a <- 1:5
b <- 6:10
c <- 11:15
save(list = ls(), file = "abc.RData")

rm(list = ls())
load("abc.RData")
ls()
a
b
c

# 행, 컬럼 병합
rbind(c(1, 2, 3), c(4, 5, 6))
(x <- data.frame(id = c(1, 2), name = c("a", "b"), stringsAsFactors = FALSE))
str(x)
(y <- rbind(x, c(3, "c")))

cbind(c(1, 2, 3), c(4, 5, 6))
(y <- cbind(x, greek = c("alpha", "beta"),  stringsAsFactors = TRUE))
str(y)
y <- cbind(x, greek = c("alpha", "beta"),  stringsAsFactors = FALSE)
str(y)

# apply 함수
sum(1:10)

d <- matrix(1:9, ncol = 3)
d
apply(d, 1, sum)
apply(d, 2, sum)

head(iris)
apply(iris[, 1:4], 2, sum)
colSums(iris[, 1:4])

# lapply 함수
(result <- lapply(1:3, function(x) { x*2 }))
result[[1]]
unlist(result)

(x <- list(a = 1:3, b = 4:6))
lapply(x, mean)
lapply(iris[, 1:4], mean)
colMeans(iris[, 1:4])

d <- as.data.frame(matrix(unlist(lapply(iris[, 1:4], mean)), ncol = 4, byrow = TRUE))
names(d) <- names(iris[, 1:4])
d

data.frame(do.call(cbind, lapply(iris[, 1:4], mean)))

x <- list(data.frame(name = "foo", value = 1), data.frame(name = "bar", value = 2))
unlist(x)
x <- list(data.frame(name = "foo", value = 1), data.frame(name = "bar", value = 2))
do.call(rbind, x)

# sapply 함수
lapply(iris[, 1:4], mean)

sapply(iris[, 1:4], mean)
class(sapply(iris[, 1:4], mean))

x <- sapply(iris[, 1:4], mean)
as.data.frame(x)
as.data.frame(t(x))

sapply(iris, class)

y <- sapply(iris[, 1:4], function(x) {x > 3})
class(y)
head(y)

# tapply 함수
tapply(1:10, rep(1, 10), sum)
tapply(1:10, 1:10 %% 2 == 1, sum)
tapply(iris$Sepal.Length, iris$Species, mean)

m <- matrix(1:8, ncol = 2, dimnames = list(c("spring", "summer", "fall", "winter"), c("male", "female")))
m
tapply(m, list(c(1, 1, 2, 2, 1, 1, 2, 2), c(1, 1, 1, 1, 2, 2, 2, 2)), sum)

# mapply 함수
rnorm(10, 0, 1)
mapply(rnorm, c(1, 2, 3), c(0, 10, 100), c(1, 1, 1))
mapply(mean, iris[, 1:4])

# summaryBy 함수
# install.packages("doBy")
library(doBy)

summary(iris)

quantile(iris$Sepal.Length)
quantile(iris$Sepal.Length, seq(0, 1, by = 0.1))

summaryBy(Sepal.Width + Sepal.Length ~ Species, iris)

# orderBy 함수
order(iris$Sepal.Width)
iris[order(iris$Sepal.Width), ]
iris[order(iris$Sepal.Length, iris$Sepal.Width), ]

orderBy(~ Sepal.Width, iris)
orderBy(~ Species + Sepal.Width, iris)

# sampleBy 함수
sample(1:10, 5)
sample(1:10, 5, replace = TRUE)
sample(1:10, 10)

iris[sample(NROW(iris), NROW(iris)), ]

sampleBy(~ Species, frac = 0.1, data = iris)

# split 함수
split(iris, iris$Species)
lapply(split(iris$Sepal.Length ,iris$Species), mean)

# subset 함수
subset(iris, Species == "setosa")
subset(iris, Species == "setosa" & Sepal.Length > 5.0)
subset(iris, select = c(Sepal.Length, Species))
subset(iris, select =- c(Sepal.Length, Species))

iris[, !names(iris) %in% c("Sepal.Length", "Species")]

# 데이터 병합
x <- data.frame(name = c("a", "b", "c"), math = c(1, 2, 3))
y <- data.frame(name = c("c", "b", "a"), english = c(4, 5, 6))
merge(x, y)

x <- data.frame(name = c("a", "b", "c"), math = c(1, 2, 3))
y <- data.frame(name = c("c", "b", "a"), english = c(4, 5, 6))
cbind(x, y)

x <- data.frame(name = c("a", "b", "c"), math = c(1, 2, 3))
y <- data.frame(name = c("a", "b", "d"), english = c(4, 5, 6))
merge(x, y)
merge(x, y, all = TRUE)

# sort 함수
x <- c(20, 11, 33, 50, 47)
sort(x)
sort(x, decreasing = TRUE)
x

# order 함수
x <- c(20, 11, 33, 50, 47)
order(x)
order(x, decreasing = TRUE)

iris[order(iris$Sepal.Length), ]
iris[order(iris$Sepal.Length, iris$Petal.Length), ]

# with 함수
print(mean(iris$Sepal.Length))
print(mean(iris$Sepal.Width))

with(iris, {
  print(mean(Sepal.Length))
  print(mean(Sepal.Width))
})

# within 함수
(x <- data.frame(val = c(1, 2, 3, 4, NA, 5, NA)))
x <- within(x, {
  val <- ifelse(is.na(val), median(val, na.rm = TRUE), val) # x$val[is.na(x$val)] <- median(val, na.rm = TRUE)
}) 
x

data(iris)
iris[1, 1] <- NA
iris
median_per_species <- sapply(split(iris$Sepal.Length, iris$Species), median, na.rm = TRUE)
iris <- within(iris, {
  Sepal.Length <- ifelse(is.na(Sepal.Length), median_per_species[Species], Sepal.Length)
})
iris

# attach 함수, detach 함수
Sepal.Width
attach(iris)
head(Sepal.Width)
detach(iris)
Sepal.Width

search()
attach(iris)
search()
detach(iris)
search()

head(iris)
attach(iris)
Sepal.Width[1] = -1
Sepal.Width
detach(iris)
head(iris)

# 조건에 맞는 인덱스 찾기
subset(iris, Species = "setosa")
iris[iris$Species == "setosa", ]

which(iris$Species == "setosa")
which.min(iris$Sepal.Length)
which.max(iris$Sepal.Length)

# 그룹별 연산
aggregate(Sepal.Width ~ Species, iris, mean)

tapply(iris$Sepal.Length, iris$Species, mean)

# 데이터의 재표현
x <- data.frame(a = c(3, 2, 9), b = c(5, 3, 2), c = c(4, 5, 7))
(x_stacked <- stack(x))
summaryBy(values ~ ind, x_stacked)
unstack(x_stacked, values ~ ind)

# install.packages("RMySQL", type = "source")
library(RMySQL)

con <- dbConnect(MySQL(), user = "rprogramming", password = "thvmxm2017!", dbname = "rprogramming", host = "127.0.0.1")
dbListTables(con)
dbGetQuery(con, "select * from score")