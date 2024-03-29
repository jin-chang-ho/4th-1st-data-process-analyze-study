methods("plot")

install.packages("mlbench")
library(mlbench)

# 산점도 그래프
data(Ozone)
plot(Ozone$V8, Ozone$V9)

# 축 이름
plot(Ozone$V8, Ozone$V9, xlab = "Sandburg Temperature", ylab = "El Monte Temperature")

# 제목
plot(Ozone$V8, Ozone$V9, xlab = "Sandburg Temperature", ylab = "El Monte Temperature", main = "Ozone")

# 점의 종류
plot(Ozone$V8, Ozone$V9, xlab = "Sandburg Temperature", ylab = "El Monte Temperature", main = "Ozone", pch = 20)
plot(Ozone$V8, Ozone$V9, xlab = "Sandburg Temperature", ylab = "El Monte Temperature", main = "Ozone", pch = "+")


# 점의 크기
plot(Ozone$V8, Ozone$V9, xlab = "Sandburg Temperature", ylab = "El Monte Temperature", main = "Ozone", cex = .1)

# 색상
plot(Ozone$V8, Ozone$V9, xlab = "Sandburg Temperature", ylab = "El Monte Temperature", main = "Ozone", col = "#FF0000") # or red

# 좌표축 값의 범위
min(Ozone$V8, na.rm = TRUE)
min(Ozone$V9, na.rm = TRUE)
max(Ozone$V8, na.rm = TRUE)
max(Ozone$V9, na.rm = TRUE)

plot(Ozone$V8, Ozone$V9, xlab = "Sandburg Temperature", ylab = "El Monte Temperature", main = "Ozone", xlim = c(0, 100), ylim = c(0, 90))

# 그래프 유형
data(cars)
str(cars)
head(cars)

plot(cars)
plot(cars, type = "l")
plot(cars, type = "b")
plot(cars, type = "o")

tapply(cars$dist, cars$speed, mean)
plot(tapply(cars$dist, cars$speed, mean), type = "o", cex = 0.5, xlab = "speed", ylab = "dist")

# 선 유형
plot(cars, type = "l", lty = "dashed")

# 그래프 배열
opar <- par(mfrow = c(1, 2))
plot(Ozone$V8, Ozone$V9, xlab = "Sandburg Temperature", ylab = "El Monte Temperature", main = "Ozone")
plot(Ozone$V8, Ozone$V9, xlab = "Sandburg Temperature", ylab = "El Monte Temperature", main = "Ozone2")
par(opar)

# 지터
head(Ozone[, c("V6", "V7")])
plot(Ozone$V6, Ozone$V7, xlab = "Windspeed", ylab = "Humidity", main = "Ozone", pch = 20, cex = .5)
plot(jitter(Ozone$V6), jitter(Ozone$V7), xlab = "Windspeed", ylab = "Humidity", main = "Ozone", pch = 20, cex = .5)

# points 함수
plot(iris$Sepal.Width, iris$Sepal.Length, cex = .5, pch = 20, xlab = "width", ylab = "length", main = "iris")
points(iris$Petal.Width, iris$Petal.Length, cex = .5, pch = "+", col = "#FF0000")

with(iris, {
  plot(NULL, xlim = c(0, 5), ylim = c(0, 10), xlab = "width", ylab = "length", main = "iris", type = "n") # xlim, ylim 적절히 설정 필요
  points(Sepal.Width, Sepal.Length, cex = .5, pch = 20)
  points(Petal.Width, Petal.Length, cex = .5, pch = "+", col = "#FF0000")
})

# lines 함수
x <- seq(0, 2 * pi, 0.1)
y <- sin(x)
plot(x, y, cex = .5, col = "red")
lines(x, y)

data(cars)
head(cars)

plot(cars)
lines(lowess(cars))

# abline 함수
plot(cars, xlim = c(0, 25))
abline(a = -5, b = 3.5, col = "red")
abline(h = mean(cars$dist), lty = 2)
abline(v = mean(cars$speed), lty = 2)

# curve 함수
curve(sin, 0, 2*pi)

# lm 함수
(m <- lm(dist ~ speed, data = cars)) # a + b * speed 모델 생성 / 여기선 -17.579+ 3.932 * speed 모델 생성

plot(cars)
abline(m)

# predict 함수
p <- predict(m, interval = "confidence") # speed의 값에 따른 신뢰구간
head(p)

# polygon 함수
x <- c(cars$speed, tail(cars$speed, 1), rev(cars$speed), cars$speed[1]) # 그래프를 닫을려고 이렇게 표현
y <- c(p[, "lwr"], tail(p[, "upr"], 1), rev(p[, "upr"]), p[, "lwr"][1])
polygon(x, y, col = rgb(.7, .7, .7, .5))

# text 함수
plot(4:6, 4:6)
text(5, 5, "X")
text(5, 5, "00", adj = c(0, 0))
text(5, 5, "01", adj = c(0, 1))
text(5, 5, "10", adj = c(1, 0))
text(5, 5, "11", adj = c(1, 1))

plot(cars, cex = .5)
text(cars$speed, cars$dist, pos = 4)

# identify 함수
plot(cars, cex = .5)
identify(cars$speed, cars$dist)

# legend 함수
plot(iris$Sepal.Width, iris$Sepal.Length, pch = 20, xlab = "width", ylab = "length")
points(iris$Petal.Width, iris$Petal.Length, pch = '+', col = '#FF0000')
legend("topright", legend = c("Sepal", "Petal"), pch = c(20, 43), col = c("black", "red"), bg = "gray") # pch는 한 가지 타입만 지정가능

# matplot 함수
(x <- seq(-2*pi, 2*pi, 0.01))
(y <- matrix(c(cos(x), sin(x)), ncol = 2))
matplot(x, y, lty = c("solid", "dashed"), cex = .2, type = "l")
abline(h = 0, v = 0)
 
# boxplot
boxplot(iris$Sepal.Width)

(boxstats <- boxplot(iris$Sepal.Width))

boxstats <- boxplot(iris$Sepal.Width, horizontal = TRUE)
text(boxstats$out, rep(1, NROW(boxstats$out)), labels = boxstats$out, pos = c(1, 1, 3, 1))

sv <- subset(iris, Species == "setosa" | Species == "versicolor")
sv$Species <- factor(sv$Species) # virginica를 없애주기 위한 처리
boxplot(Sepal.Width ~ Species, data = sv, notch = TRUE)

# histgram
hist(iris$Sepal.Width)

hist(iris$Sepal.Width, freq = FALSE)

(x <- hist(iris$Sepal.Width, freq = FALSE))
sum(x$density) * 0.2

# density
plot(density(iris$Sepal.Width))

hist(iris$Sepal.Width, freq = FALSE)
lines(density(iris$Sepal.Width))

plot(density(iris$Sepal.Width))
rug(jitter(iris$Sepal.Width)) # 실제 데이터의 위치를 x축에 표시

# barplot
barplot(tapply(iris$Sepal.Width, iris$Species, mean))

# pie
cut(1:10, breaks = c(0, 5, 10)) # 구간을 나누는 cut 함수
cut(1:10, breaks = 3)
cut(iris$Sepal.Width, breaks = 10)

rep(c("a", "b", "c"), 1:3)
table(rep(c("a", "b", "c"), 1:3)) # 빈도를 구해주는 table 함수
table(cut(iris$Sepal.Width, breaks = 10))

pie(table(cut(iris$Sepal.Width, breaks = 10)))

# mosaicplot
data(Titanic)
str(Titanic)

mosaicplot(Titanic, color = TRUE)
mosaicplot(~ Class + Survived, data = Titanic, color = TRUE, cex = 1.2)

# pairs
pairs(~ Sepal.Width + Sepal.Length + Petal.Width + Petal.Length, data = iris, pch = c(1, 2, 3)[iris$Species])

levels(iris$Species)
as.numeric(iris$Species)