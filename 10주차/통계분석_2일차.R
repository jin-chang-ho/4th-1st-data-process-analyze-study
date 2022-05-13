# 피어슨 상관 계수 (연속형 데이터)
cor(iris$Sepal.Width, iris$Sepal.Length)
cor(iris[,1:4])
symnum(cor(iris[, 1:4]))

# install.packages('corrgram')
library(corrgram)
corrgram(iris, upper.panel = panel.conf)

cor(1:10, 1:10)
cor(1:10, 1:10*2)
x = 1:10
y = x^3
cor(x, y)

# 스피어만 상관 계수 (이산형, 순서형 데이터)
x <- c(3, 4, 5, 3, 2, 1, 7, 5)
rank(sort(x))
(m <- matrix(c(1:10, (1:10)^2), ncol = 2))
cor(m, method = "spearman")
cor(m, method = "pearson")

# 켄달의 순위 상관 계수
cor(c(1, 2, 3, 4, 5), c(1, 0, 3, 4, 5), method = "kendall")

# 상관 계수 검정 (상관 계수가 다르다면 가장 작은 값을 사용하는 것이 바람직)
cor.test(c(1, 2, 3, 4, 5), c(1, 0, 3, 4, 5), method = "pearson")
cor.test(c(1, 2, 3, 4, 5), c(1, 0, 3, 4, 5), method = "spearman")
cor.test(c(1, 2, 3, 4, 5), c(1, 0, 3, 4, 5), method = "kendall")

# 일표본 평균 (하나의 모집단으로부터 표본을 추출하기)
x <- rnorm(30)
t.test(x) # 정확한 모평균은 모두 다르지만 귀무가설에 의해 모평균은 0이라 본다.

x <- rnorm(30, mean = 10)
t.test(x, mu = 10)

# 독립 이표본 평균 (두 모집단에서 표본을 추출한 뒤 두 모집단의 평균이 동일한 지 확인하기, 각 데이터 간 상관관계가 없어야 함)
sleep # 최면성 약물을 10명의 환자에게 투여했을 때 수면 시간의 증가를 기록한 데이터(extra : 수면 시간의 증가량, group : 사용한 약물의 종류, ID : 환자 식별 번호)
sleep2 <- sleep[, -3]
sleep2

tapply(sleep2$extra, sleep2$group, mean)

# install.packages('doBy')
library(doBy)
summaryBy(extra ~ group, sleep2)

var.test(extra ~ group, sleep2) # p-value가 0.05보다 높으면 두 그룹간의 모분산이 같다.

t.test(extra ~ group, data = sleep2, paired = FALSE, var.equal = TRUE) # paired = FALSE : 독립 이표본 검정, var.equal = TRUE : 모분산 동일여부

# 짝지은 이표본 평균 (표본을 추출할 때 연관된 것끼리 짝은 지어 데이터를 추출하기)
sleep
with(sleep, t.test(extra[group == 1], extra[group == 2], paired = TRUE))

# 이표본 분산 (모집단 표본의 분산이 동일한 지 확인하기)
with(iris, var.test(Sepal.Width, Sepal.Length))

# 일표본 비율 (모집단의 비를 추정하고 가설 검정하기)
prop.test(42, 100) # 이항 분포를 정규 분포로 근사
binom.test(42, 100) # 이항 분포

# 이표본 비율 (두 집단 표본의 비율로 모집단에서의 비율을 비교하기)
prop.test(c(45, 55), c(100, 90))