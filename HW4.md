Facebook粉絲團分析（分析專頁名稱朱立倫）
分析朱立倫從2016/01/01到2016/04/09發出的文章。
	================
	
	``` if (!require('Rfacebook')){
    install.packages("Rfacebook")
    library(Rfacebook)
    }
	```
 讀取朱立倫粉絲團資料
 --------------------

``` r
token<-'CAACEdEose0cBAGzAW2JrtuYSx5ZAy7zv75qWmgMV0UzONan3DjbZBpYWVeTuOkXd8tToF1285Kw2w4NzM0ORGArPRrnwR0LLsYjh99iiTd4535fEOBMP6IlLjHkIAWy2LePpwhxVvAlBdt9KRYNKxtBCtoTUXxb5QVNngJ5I3RhfTvIxhyhW0M0CDrr4fxQ6FotKJdowZDZD'
totalPage<-NULL
lastDate<-Sys.Date()
DateVectorStr<-as.character(seq(as.Date("2016-01-01"),lastDate,by="5 days"))
for(i in 1:(length(DateVectorStr)-1)){
    tempPage<-getPage("llchu", token,
                      since = DateVectorStr[i],until = DateVectorStr[i+1])
    totalPage<-rbind(totalPage,tempPage)
}
```
    ## 14 posts 13 posts 25 posts 4 posts 5 posts 5 posts 7 posts 5 posts 1 posts 6 posts 5 posts 3 posts 4 posts 6 posts 4 posts 8 posts 5 posts 5 posts 4 posts 5 posts 

``` r
nrow(totalPage)
```
   ## [1] 134

發現朱立倫今年起到04/10共發了134篇文章!

每日發文數分析
-------------- 
發現朱立倫在2016/01/12那天發文數是最多次的，可能是因為靠近01/16選舉日那天了，提倡大家來投票，不斷發文使訊息浮起來讓民眾看見。

``` r
totalPage$datetime <- as.POSIXct(totalPage$created_time, 
                                 format = "%Y-%m-%dT%H:%M:%S+0000", 
                                 tz = "GMT") #2016-01-16T15:05:36+0000
totalPage$dateTPE <- format(totalPage$datetime, "%Y-%m-%d", 
                            tz = "Asia/Taipei") #2016-01-16
totalPage$weekdays <-weekdays(as.Date(totalPage$dateTPE))
PostCount<-aggregate(id~dateTPE,totalPage,length)
library(knitr)
kable(head(PostCount[order(PostCount$id,decreasing = T),]))
```

|   |dateTPE    | id|
|:--|:----------|--:|
|12 |2016-01-12 |  7|
|13 |2016-01-13 |  5|
|14 |2016-01-14 |  5|
|15 |2016-01-15 |  5|
|65 |2016-03-20 |  4|
|1  |2016-01-01 |  3|

每日獲得讚數分析
----------------
分析後發現最高按讚數落在2016/01/16，也就是大選當天po的文章讚數平均有高達8萬個!! 平均讚數最高的第2名是02/06那天Po的一篇文章，內容是新北市派出30名特搜隊員去台南幫忙救災!! 發現按讚數和媒體報導有正相關。

``` r
totalPage$datetime <- as.POSIXct(totalPage$created_time, 
                                 format = "%Y-%m-%dT%H:%M:%S+0000", 
                                 tz = "GMT") #2016-01-16T15:05:36+0000
totalPage$dateTPE <- format(totalPage$datetime, "%Y-%m-%d", 
                            tz = "Asia/Taipei") #2016-01-16
totalPage$weekdays <-weekdays(as.Date(totalPage$dateTPE))
LikeCount<-aggregate(likes_count~dateTPE,totalPage,mean)
library(knitr)
kable(head(LikeCount[order(LikeCount$likes_count,decreasing = T),]))
```

|   |dateTPE    | likes_count|
|:--|:----------|-----------:|
|16 |2016-01-16 |     83386.0|
|34 |2016-02-06 |     57639.0|
|9  |2016-01-09 |     52729.5|
|15 |2016-01-15 |     49404.6|
|17 |2016-01-18 |     46132.0|
|36 |2016-02-08 |     41877.0|
每日評論數分析
--------------

評論數最高的前幾名也都是大選前幾天!!可見大家都有很多的話想要跟朱立倫說~

``` r
totalPage$datetime <- as.POSIXct(totalPage$created_time, 
                                 format = "%Y-%m-%dT%H:%M:%S+0000", 
                                 tz = "GMT") #2016-01-16T15:05:36+0000
totalPage$dateTPE <- format(totalPage$datetime, "%Y-%m-%d", 
                            tz = "Asia/Taipei") #2016-01-16
totalPage$weekdays <-weekdays(as.Date(totalPage$dateTPE))
CommentsCount<-aggregate(comments_count~dateTPE,totalPage,mean)
library(knitr)
kable(head(CommentsCount[order(CommentsCount$comments_count,decreasing = T),]))

|   |dateTPE    | comments_count|
|:--|:----------|--------------:|
|16 |2016-01-16 |        10605.5|
|15 |2016-01-15 |         7843.6|
|17 |2016-01-18 |         3629.0|
|9  |2016-01-09 |         1883.0|
|18 |2016-01-19 |         1649.0|
|34 |2016-02-06 |         1377.0|

每日分享數分析
--------------

在大選前日大家為自己所支持的候選人加油，為朱立倫宣傳他的理念，想讓更多人看到。

``` r
totalPage$datetime <- as.POSIXct(totalPage$created_time, 
                                 format = "%Y-%m-%dT%H:%M:%S+0000", 
                                 tz = "GMT") #2016-01-16T15:05:36+0000
totalPage$dateTPE <- format(totalPage$datetime, "%Y-%m-%d", 
                            tz = "Asia/Taipei") #2016-01-16
totalPage$weekdays <-weekdays(as.Date(totalPage$dateTPE))
SharesCount<-aggregate(shares_count~dateTPE,totalPage,mean)
library(knitr)
kable(head(SharesCount[order(SharesCount$shares_count,decreasing = T),]))
```

|   |dateTPE    | shares_count|
|:--|:----------|------------:|
|15 |2016-01-15 |     2342.600|
|1  |2016-01-01 |     1521.000|
|16 |2016-01-16 |     1363.500|
|34 |2016-02-06 |     1265.000|
|12 |2016-01-12 |     1000.429|
|9  |2016-01-09 |      937.000|