# 데이터 프레임
(d <- data.frame(x = c(1, 2, 3, 4, 5), y = c(2, 4, 6, 8, 10)))
(d <- data.frame(x = c(1, 2, 3, 4, 5), y = c(2, 4, 6, 8, 10), z = c('M', 'F', 'M', 'F', 'M'), stringsAsFactors = TRUE))
str(d)

d$x
d$x <- 6:10
d
d$w <- c("A", "B", "C", "D", "E")
str(d)

(x <- data.frame(1:3))
colnames(x) <- c('val')
x
rownames(x) <- c('a', 'b', 'c')
x

d <- data.frame(x = c(1, 2, 3, 4, 5), y = c(2, 4, 6, 8, 10))
d$x
d[1, ]
d[1, 2]
d[c(1, 3), 2]
d[-1, -2]
d[, c("x", "y")]
d[, c("x")]
d[, c("x"), drop = FALSE]

(d <- data.frame(a = 1:3, b = 4:6, c = 7:9))
d[, names(d) %in% c("b", "c")]
d[, !names(d) %in% c("a")]

d <- data.frame(x = 1:1000)
d
head(d)
tail(d)
View(d)

# 타입 판별
class(c(1, 2))
class(matrix(c(1, 2)))
class(data.frame(x = c(1, 2), y = c(3, 4)))

str(c(1, 2))
str(matrix(c(1, 2)))
str(list(c(1, 2)))
str(data.frame(x=c(1, 2)))

is.factor(factor(c("m", "f")))
is.numeric(1:5)
is.character(c("a", "b"))
is.data.frame(data.frame(x = 1:5))

# 타입 변환
x <- c("a", "b", "c")
as.factor(x)
as.character(as.factor(x))

x <- matrix(1:9, ncol = 3)
as.data.frame(x)
(x <- data.frame(matrix(c(1, 2, 3, 4), ncol = 2)))
data.frame(list(x = c(1, 2), y = c(3, 4)))

as.factor(c("m", "f"))
factor(c("m", "f"), levels = c("m", "f"))