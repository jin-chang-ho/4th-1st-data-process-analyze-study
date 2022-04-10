# 분포함수
rnorm(100, 0, 10)
plot(density(rnorm(1000000, 0, 10)))

dpois(3, 1)
(1^3 * exp(-1)) / (factorial(3))
pnorm(0)
qnorm(0.5)

# 표본 평균, 분산, 표준 편차
mean(1:5)
var(1:5)
sum((1:5 - mean(1:5))^2) / (5-1)
sd(1:5)

# 최솟값, 1사분위수, 중앙값, 3사분위수, 최댓값
fivenum(1:11)
summary(1:11)

fivenum(c(1, 2, 3, 4))
summary(c(1, 2, 3, 4))

# 최빈값
(x <- factor(c("a", "b", "c", "C", "c", "d", "d")))
table(x)
which.max(table(x))
names(table(x))[3]

# 단순임의추출
sample(1:10, 5)
sample(1:10, 5, replace = TRUE)
sample(1:10, 5, replace = TRUE, prob = 1:10)

# 층화임의추출
# install.packages("sampling")
library(sampling)
(x <- strata(c("Species"), size = c(3, 3, 3), method = "srswor", data = iris))
getdata(iris, x)

strata(c("Species"), size = c(3, 1, 1), method = "srswr", data = iris)

iris$Species2 <- rep(1:2, 75)
strata(c("Species", "Species2"), size = c(1, 1, 1, 1, 1, 1), method = "srswr", data = iris)

# 계통추출
# install.packages("doBy")
library(doBy)
(x <- data.frame(x = 1:10))
sampleBy(~1, frac = 0.3, data = x,  systematic = TRUE)

# xtabs 함수
table(c("a", "b", "b", "b", "c", "c", "d"))
d <- data.frame(x = c("1", "2", "2", "1"), y = c("A", "B", "A", "B"), num = c(3, 5, 8, 7))
(xt <- xtabs(num ~ x + y, data = d))

(d2 <- data.frame(x = c("A", "A", "A", "B", "B")))
xtabs(~x, d2)

# 합, 비율 계산
xt
margin.table(xt, 1)
margin.table(xt, 2)
margin.table(xt)

xt
prop.table(xt, 1)
prop.table(xt, 2)
prop.table(xt)

# 카이 제곱 검정
library(MASS)
data(survey)
str(survey)
head(survey[c("Sex", "Exer")])
xtabs(~ Sex + Exer, data = survey)
chisq.test(xtabs(~ Sex + Exer, data = survey))

# 피셔의 정확 검정
xtabs(~ W.Hnd + Clap, data = survey)
chisq.test(xtabs(~ W.Hnd + Clap, data = survey))
fisher.test(xtabs(~ W.Hnd + Clap, data = survey))

# 맥니마 검정
Performance <- matrix(c(794, 86, 150, 570), nrow = 2, dimnames = list("1st Survey" = c("Approve", "Disapprove"), "2nd Survey" = c("Approve", "Disapprove")))
Performance
mcnemar.test(Performance)

binom.test(86, 86 + 150, .5) # 이항 분포 검정

# 카이 제곱 검정
table(survey$W.Hnd)
chisq.test(table(survey$W.Hnd), p = c(.3, .7))

# 샤피로 윌크 검정
shapiro.test(rnorm(1000))

# 콜모고로프 스미르노프 검정
ks.test(rnorm(100), rnorm(100))
ks.test(rnorm(100), runif(100))
ks.test(rnorm(1000), "pnorm", 0, 1)

# Q-Q도
x <- rnorm(1000, mean = 10, sd = 1)
qqnorm(x)
qqline(x, lwd = 2)

x <- runif(1000)
qqnorm(x)
qqline(x, lwd = 2)

qqplot(runif(1000, min = 1, max = 10), 1:10) # 정규 분포 x

