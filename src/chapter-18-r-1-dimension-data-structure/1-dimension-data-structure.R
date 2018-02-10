# vector demo
score <- c(20,10,50,60)
score

scoreError <- c(20,10,50,"60")
scoreError

oneToFive <- 1:5
oneToFive

# 取得第3個分數
score[3]

# 依照條件取得值
score > 30
score[score > 30]

# 找出某個條件的比例
mean(score > 30)

# 增加
score[5] <- 100
# 刪除最後一筆
score <- score[1:4]

# list demo
# vector demo
listScore <- list(20,10,50,"60")
listScore

name <- c("A", "B", "C", "D")
scoreWithName <- list(name,score)
scoreWithName

scoreWithName[[1]][1]
