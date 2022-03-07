# =는 명령의 최상위, <-는 어느 곳에서나 사용 가능
mean(x <- c(1, 2, 3))
x
mean(x = c(1, 2, 3))
x

# 숫자
a <- 3
b <- 4.5
c <- a + b
print(c)
c

# NA
one <- 80
two <- 90
three <- 75
four <- NA
is.na(four)

# NULL
x <- NULL
is.null(x)
is.null(1)
is.null(NA)
is.na(NULL)

# 문자열
a <- "hello"
print(a)
a <- 'hello'
print(a)

# 진릿값
TRUE & TRUE
TRUE & FALSE
TRUE | TRUE
TRUE | FALSE
!TRUE
!FALSE
c(TRUE, TRUE) & c(TRUE, FALSE)
c(TRUE, TRUE) && c(TRUE, FALSE)

# 팩터
sex <- factor("m", c("m", "f"))
sex

nlevels(sex)
levels(sex)
levels(sex)[1]
levels(sex)[2]

sex
levels(sex) <- c("male", "female")
sex

factor(c("m", "m", "f"), c("m", "f"))
factor(c("m", "m", "f"))
ordered("a", c("a", "b", "c"))

# 벡터
(x <- c(1, 2, 3, 4, 5))
(x <- c("1", 2, "3"))
c(1, 2, 3)
c(1, 2, 3, c(1, 2, 3))

x <- c(1, 3, 4)
names(x) <- c("kim", "seo", "park")
x

x <- c("a", "b", "c")
x[1]
x[3]

x <- c("a", "b", "c")
x[-1]
x[-2]

x <- c("a", "b", "c")
x[c(1, 2)]
x[c(1, 3)]

x <- c("a", "b", "c")
x[1:2]
x[1:3]

x <- c(1, 3, 4)
names(x) <- c("kim", "seo", "park")
x
x["seo"]
x[c("seo", "park")]
names(x)[2]

x <- c("a", "b", "c")
length(x)
nrow(x)
NROW(x)

identical(c(1, 2, 3), c(1, 2, 3))
identical(c(1, 2, 3), c(1, 2, 100))

"a" %in% c("a", "b", "c")
"d" %in% c("a", "b", "c")

x <- c(1, 2, 3, 4, 5)
x + 1
10 - x

c(1, 2, 3) == c(1, 2, 100)
c(1, 2, 3) != c(1, 2, 100)

union(c("a", "b", "c"), c("a", "d"))
intersect(c("a", "b", "c"), c("a", "d"))
setdiff(c("a", "b", "c"), c("a", "d"))
setequal(c("a", "b", "c"), c("a", "d"))
setequal(c("a", "b", "c"), c("a", "b", "c", "c"))

seq(3, 7)
seq(7, 3)
seq(3, 7, 2)
seq(3, 7, 3)
3:7
7:3

