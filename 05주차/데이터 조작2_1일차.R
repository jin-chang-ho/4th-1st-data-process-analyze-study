# install.packages("sqldf")
library(sqldf)

data(iris)
colnames(iris) <- c("Sepal_Length", "Sepal_Width", "Petal_Length", "Petal_Width", "Species")

# sqldf 함수
sqldf("select distinct Species from iris")

sqldf("select avg(Sepal_Length) from iris where Species = 'setosa'")

mean(subset(iris, Species == "setosa")$Sepal_Length)

sqldf("select species, avg(sepal_length) from iris group by species")

sapply(split(iris$Sepal_Length, iris$Species), mean)

# install.packages("plyr")
library(plyr)

data(iris)

# adply 함수
apply(iris[, 1:4], 1, function(row) {print(row)})
apply(iris, 1, function(row) { print(row)})

adply(iris, 1, function(row) { row$Sepal.Length >= 5.0 & row$Species == "setosa"})
adply(iris, 1, function(row) { data.frame(sepal_ge_5_setosa = c(row$Sepal.Length >= 5.0 & row$Species == "setosa"))})

# ddply 함수
ddply(iris, .(Species), function(sub) {data.frame(sepal.width.mean = mean(sub$Sepal.Width))})
ddply(iris, .(Species, Sepal.Length > 5.0), function(sub) {data.frame(sepal.width.mean = mean(sub$Sepal.Width))})

head(baseball)
head(subset(baseball, id == "ansonca01"))
ddply(baseball, .(id), function(sub) {mean(sub$g)})

# transform 함수
head(ddply(baseball, .(id), transform, cyear = year - min(year) + 1))

# mutate 함수
head(ddply(baseball, .(id), transform, cyear = year - min(year) + 1, log_cyear = log(cyear))) # 앞서 추가한 컬럼을 참조할 수 없어 에러
head(ddply(baseball, .(id), mutate, cyear = year - min(year) + 1, log_cyear = log(cyear)))

# summarise 함수
head(ddply(baseball, .(id), summarise, minyear = min(year)))
head(ddply(baseball, .(id), summarise, minyear = min(year), maxyear = max(year)))

# subset 함수
head(ddply(baseball, .(id), subset, g == max(g)))

# mdply 함수
(x <- data.frame(mean = 1:5, sd = 1:5))
mdply(x, rnorm, n = 2)

# install.packages("reshape2")
library(reshape2)
head(french_fries)

# melt 함수
m <- melt(french_fries, id.vars = 1:4)
head(m)

ddply(m, .(variable), summarise, mean = mean(value, na.rm = TRUE))

french_fries[!complete.cases(french_fries),]
m <- melt(french_fries, id.vars = 1:4, na.rm = TRUE)
head(m)

# cast 함수
m <- melt(french_fries, id.vars = 1:4)
r <- dcast(m, time + treatment + subject + rep ~ ...)
rownames(r) <- NULL
rownames(french_fries) <- NULL
identical(r, french_fries)

m <- melt(french_fries, id.vars = 1:4)
dcast(m, time ~ variable)
dcast(m, time ~ variable, mean, na.rm = TRUE)W
dcast(m, time ~ treatment + variable, mean, na.rm = TRUE)

ddply(m, .(time, treatment, variable), function(rows) {return(mean(rows$value, na.rm = TRUE))})