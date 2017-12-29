## [10]用.Net Core跑Hadoop MapReduce - Streaming介紹

這個資料夾的內容是30篇文章裡面的第10章 - 介紹如何透過Hadoop Streaming用.net core去做MapReduce

詳細的內容可以參考：[部落格文章-[10]用.Net Core跑Hadoop MapReduce - Streaming介紹](http://blog.alantsai.net/2017/12/data-science-series-10-hadoop-streaming-intro-use-net-core-for-MapReduce.html)

## 如何使用

以下會透過powershell指令的動作作說明 - 如果不習慣用指令也可以用對應的GUI工具。

整個指令做完等於：

- 發佈一個net core 2.0的Map Reduce程式
- 用docker啟動hadoop - 1個master 1個slave
- 把net core 2.0的程式和測試資料放到hadoop
- 執行MapReduce


1. 先透過clone的方式把整個repo clone下來：
```powershell
git clone https://github.com/alantsai/blog-data-science-series.git
```  

2. 更換到當前目錄 - 如果clone下來沒有改名操作會是：
```powershell
cd blog-data-science-series\chapter-10-dotnet-mapreduce
```

3. 發佈net core 2.0的MapReduce程式
```powershell
dotnet publish -o ${pwd}\dotnetmapreduce .\DotNetMapReduceWordCount\DotNetMapReduceWordCount.sln
```

4. 啟動hadoop
```powershell
docker-compose up -d
```

5. 把檔案copy到hadoop的master裡面，並且把測試檔案放到HDFS裡面
```powershell
docker cp dotnetmapreduce hadoop-dotnet-master:/dotnetmapreduce

docker exec -it hadoop-dotnet-master bash

hadoop fs -mkdir -p /input
hadoop fs -copyFromLocal /dotnetmapreduce/jane_austen.txt /input
```

6. 執行MapReduce (這個實在hadoop master執行)
```powershell
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-2.7.2.jar \
    -files "/dotnetmapreduce" \
    -mapper "dotnet dotnetmapreduce/DotNetMapReduceWordCount.Mapper.dll" \
    -reducer  "dotnet dotnetmapreduce/DotNetMapReduceWordCount.Reducer.dll" \
    -input /input/* -output /output
```
