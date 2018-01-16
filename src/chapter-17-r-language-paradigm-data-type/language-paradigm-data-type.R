# 兩個值相加結果是vector
a <- 2 + 3

# vector單數運算
b <- c(2,3)
b * 2

# 兩個vector運算
c <- c(6,7)
b+c

# functional programming demo
sapply(b, function(x){x + 2})

# Logical
l <- c(TRUE, FALSE, T, F)
class(l)
is.logical(l)

# numeric
n <- c(10.5, 2.5)
class(n)
is.numeric(n)

# integer
i <- c(1L,2L)
class(i)
is.integer(i)

# character
char <- c("abc", '123', 'TRUE')
class(char)
is.character(char)

# complex
complex <- c(3 + 2i)
class(complex)
is.complex(complex)

# raw
raw <- charToRaw("hello")
class(raw)
is.raw(raw)

# factor
gender <- factor(c("male", "female"))
class(gender)
is.factor(gender)
