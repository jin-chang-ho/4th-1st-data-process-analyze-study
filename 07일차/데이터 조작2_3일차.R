# install.packages('data.table')
library(data.table) 

# data.table 생성
(iris_table <- as.data.table(iris))
iris_table[1:10, ]
print(iris_table, nrows = Inf)

(x <- data.table(x = c(1, 2, 3), y = c("a", "b", "c")))

class(data.table())

tables()

# 데이터 접근과 그룹 연산
DT <- as.data.table(iris)
DT[1, ]
DT[DT$Species == "setosa", ]

DT[1, Sepal.Length] # "Sepal.Length" -> df의 문법, dt에선 no
DT[1, list(Sepal.Length, Species)]

DT[, mean(Sepal.Length)]
DT[, mean(Sepal.Length - Sepal.Width)]

head(iris)
iris[1, 1]
DT[1, 1] # 원래는 행 번호 출력
DT[1, 1, with = FALSE] # 컬럼부터 인식, so 5.1 출력
iris[1, c("Sepal.Length")]
DT[1, c("Sepal.Length")] # 원래는 c("Sepal.Length")가 연산식으로 인식돼 Sepal.Length 출력
DT[1, c("Sepal.Length"), with = FALSE] # 컬럼 이름으로 취급

DT[, mean(Sepal.Length), by = "Species"]

DT <- data.table(x = c(1, 2, 3, 4, 5), y = c("a", "a", "a", "b", "b"), z = c("c", "c", "d", "d", "d"))
DT
DT[, mean(x), by = "y,z"] # by 안 띄워쓰기 금지

# 키를 사용한 빠른 데이터 접근
DF <- data.frame(x = runif(780000), y = rep(LETTERS, each = 30000)) # runif : 연속균등분포, LETTERS : 알파벳
str(DF)
head(DF)
system.time(x <- DF[DF$y == "C", ])

DT <- as.data.table(DF)
setkey(DT, y)
system.time(x <- DF[DF$y == "C", ])

DT[J("C"), mean(x)]
DT[J("C"), list(x_mean = mean(x), x_std = sd(x))]

# 키를 사용한 데이터 테이블 병합
DT1 <- data.table(x = runif(260000), y = rep(LETTERS, each = 10000))
DT2 <- data.table(y = c("A", "B", "C"), z = c("a", "b", "c"))
setkey(DT1, y)
DT1[DT2, ]
setkey(DT2, y)
DT2[DT1, ]

DT1 <- data.table(x = runif(260000), y = rep(LETTERS, each = 10000))
DT2 <- data.table(y = c("A", "B", "C"), z = c("a", "b", "c"))
setkey(DT1, y)
system.time(DT1[DT2, ])

DF1 <- as.data.frame(DT1)
DF2 <- as.data.frame(DT2)
system.time(merge(DF1, DF2))

# 참조를 사용한 데이터 수정
m <- matrix(1, nrow = 1000, ncol = 100)
DF <- as.data.frame(m)
DT <- as.data.table(m)

system.time({
  for (i in 1:1000) {
    DF[i, 1] <- i
  }
})

system.time({
  for (i in 1:1000) {
    DT[i, V1 := i]
  }
})

# install.packages("plyr")  
library(plyr)

system.time(x <- ldply(1:10000, function(x) {
  data.frame(val = x,
             val2 = 2 * x,
             val3 = 2 / x,
             val4 = 4 * x,
             val5 = 4 / x)
}))

system.time(x <- llply(1:10000, function(x) {
  data.frame(val = x,
             val2 = 2 * x,
             val3 = 2 / x,
             val4 = 4 * x,
             val5 = 4 / x)
}))

x <- lapply(1:10000, function(x) {
  data.frame(val = x,
             val2 = 2 * x,
             val3 = 2 / x,
             val4 = 4 * x,
             val5 = 4 / x)
})
system.time(y <- do.call(rbind, x))

system.time(x <- ldply(1:10000, function(x) {
  data.frame(val = x,
             val2 = 2 * x,
             val3 = 2 / x,
             val4 = 4 * x,
             val5 = 4 / x)
}))

system.time(x <- llply(1:10000, function(x) {
  data.frame(val = x,
             val2 = 2 * x,
             val3 = 2 / x,
             val4 = 4 * x,
             val5 = 4 / x)
}))
system.time(x <- rbindlist(x))