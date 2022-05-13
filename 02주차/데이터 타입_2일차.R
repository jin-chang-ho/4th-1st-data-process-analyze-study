# 리스트
(x <- list(name = "foo", height = 70))
(x <- list(name = "foo", height = c(1, 3, 5)))
list (a = list(val = c(1, 2, 3)), b = list(val = c(1, 2, 3, 4)))

(x <- list(name = "foo", height = c(1, 3, 5)))
x$name
x$height
x[[1]]
x[[2]]
x[1]
x[2]

# 행렬
matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3)
matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), ncol = 3)
matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3, byrow = TRUE)
matrix(1:9, nrow = 3, dimnames = list(c("r1", "r2", "r3"), c("c1", "c2", "c3")))

(x <- matrix(1:9, ncol = 3))
dimnames(x) <- list(c("r1", "r2", "r3"), c("c1", "c2", "c3"))
x

x <- matrix(1:9, ncol = 3)
rownames(x)
rownames(x) <- c("r1", "r2", "r3")
x
colnames(x) <- c("c1", "c2", "c3")
x

(x <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), ncol = 3))
x[1, 1]
x[1, 2]
x[2, 1]
x[2, 2]
x[1:2, ]
x[-3, ]
x[c(1, 3), c(1, 3)]

(x <- matrix(1:9, nrow = 3, dimnames = list(c("r1", "r2", "r3"), c("c1", "c2", "c3"))))
x["r1", ]

x <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3)
x * 2
x / 2
x + x
x - x
x %*% x

x <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3)
t(x)

(x <- matrix(c(1, 2, 3, 4), ncol = 2))
solve(x)
x %*% solve(x)

(x <- matrix(c(1, 2, 3, 4, 5, 6), ncol = 3))
nrow(x)
ncol(x)

x <- matrix(c(1, 2, 3, 4, 5, 6), ncol = 3)
dim(x)
dim(x) <- c(3, 2)
x

# 배열
array(1:12, dim = c(3, 4))
(x <- array(1:12, dim = c(2, 2, 3)))
x[, , 3]
x[1, 1, 1]
x[1, 2, 3]