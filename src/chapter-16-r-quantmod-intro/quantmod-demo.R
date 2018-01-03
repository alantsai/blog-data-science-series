install.packages("quantmod")
library("quantmod")

# 取得google的股票，並且看看前6筆資料
getSymbols("GOOG")
head(GOOG)

# 畫出走勢
chartSeries(GOOG)
chartSeries(GOOG["2017-11-03::2018-01-03",])

# 計算 20日和60日均線
ma20<-runMean(GOOG[,4],n=20)
ma60<-runMean(GOOG[,4],n=60)
head(ma20, 25)

# 畫上線
chartSeries(GOOG["2017-01-03::2018-01-03",], theme = "white")
addTA(ma20,on=1,col="blue")
addTA(ma60,on=1,col="red") 
