NBA 2014-2015球季 各隊分析
2	================
3	
4	``` r
5	#install.packages("SportsAnalytics")
6	library(SportsAnalytics)
7	NBA1415<-fetch_NBAPlayerStatistics("14-15")
8	```
9	1.各隊最辛苦的球員
10	----------
11	計算依據為全季出賽時間最多的球員
12	``` r
13	MaxTime<-aggregate(TotalMinutesPlayed~Team,NBA1415,max)
14	#tapply(NBA1415$TotalMinutesPlayed,NBA1415$Team,max)
15	NBA1415MaxTime<-merge(NBA1415,MaxTime)
16	output<-NBA1415MaxTime[order(NBA1415MaxTime$TotalMinutesPlayed,decreasing = T),c("Team","Name","TotalMinutesPlayed")]
17	library(knitr)
18	kable(output, digits=2)
19	```
20	|   |Team |Name             | TotalMinutesPlayed|
21	|:--|:----|:----------------|------------------:|
22	|11 |HOU  |James Harden     |               2979|
23	|18 |MIN  |Andrew Wiggins   |               2971|
24	|25 |POR  |Damian Lillard   |               2928|
25	|13 |LAC  |Chris Paul       |               2860|
26	|30 |WAS  |John Wall        |               2841|
27	|24 |PHO  |Eric Bledsoe     |               2799|
28	|3  |BRO  |Joe Johnson      |               2787|
29	|6  |CLE  |Kyrie Irving     |               2735|
30	|7  |DAL  |Monta Ellis      |               2698|
31	|19 |NOR  |Tyreke Evans     |               2695|
32	|15 |MEM  |Marc Gasol       |               2690|
33	|5  |CHI  |Pau Gasol        |               2682|
34	|26 |SAC  |Ben Mclemore     |               2674|
35	|8  |DEN  |Ty Lawson        |               2668|
36	|16 |MIA  |Goran Dragic     |               2641|
37	|29 |UTA  |Gordon Hayward   |               2618|
38	|10 |GSW  |Stephen Curry    |               2613|
39	|9  |DET  |Ke Caldwell-pope |               2591|
40	|22 |ORL  |Victor Oladipo   |               2572|
41	|17 |MIL  |G Antetokounmpo  |               2542|
42	|2  |BOS  |Avery Bradley    |               2427|
43	|28 |TOR  |Kyle Lowry       |               2422|
44	|1  |ATL  |Kyle Korver      |               2418|
45	|12 |IND  |Solomon Hill     |               2380|
46	|4  |CHA  |Gerald Henderson |               2323|
47	|23 |PHI  |Nerlens Noel     |               2311|
48	|27 |SAN  |Danny Green      |               2311|
49	|21 |OKL  |Russel Westbrook |               2302|
50	|14 |LAL  |Wesley Johnson   |               2244|
51	|20 |NYK  |Shane Larkin     |               1864|
52	
53	2.各隊得分王
54	----------
55	
56	計算依據為全季總得分最多的球員
57	
58	``` r
59	MaxPoint<-aggregate(TotalPoints~Team,NBA1415,max)
60	#tapply(NBA1415$TotalPoints,NBA1415$Team,max)
61	NBA1415MaxPoint<-merge(NBA1415,MaxPoint)
62	output<-NBA1415MaxPoint[order(NBA1415MaxPoint$TotalPoints,decreasing = T),c("Team","Name","TotalPoints")]
63	library(knitr)
64	kable(output, digits=2)
65	```
66	|   |Team |Name             | TotalPoints|
67	|:--|:----|:----------------|-----------:|
68	|11 |HOU  |James Harden     |        2217|
69	|10 |GSW  |Stephen Curry    |        1900|
70	|21 |OKL  |Russel Westbrook |        1886|
71	|6  |CLE  |Lebron James     |        1740|
72	|25 |POR  |Damian Lillard   |        1720|
73	|19 |NOR  |Anthony Davis    |        1656|
74	|13 |LAC  |Chris Paul       |        1564|
75	|7  |DAL  |Monta Ellis      |        1513|
76	|29 |UTA  |Gordon Hayward   |        1463|
77	|5  |CHI  |Pau Gasol        |        1446|
78	|26 |SAC  |Rudy Gay         |        1432|
79	|22 |ORL  |Nikola Vucevic   |        1428|
80	|15 |MEM  |Marc Gasol       |        1413|
81	|18 |MIN  |Andrew Wiggins   |        1387|
82	|30 |WAS  |John Wall        |        1385|
83	|24 |PHO  |Eric Bledsoe     |        1377|
84	|16 |MIA  |Dwyane Wade      |        1331|
85	|28 |TOR  |Kyle Lowry       |        1244|
86	|3  |BRO  |Brook Lopez      |        1236|
87	|1  |ATL  |Paul Millsap     |        1218|
88	|8  |DEN  |Ty Lawson        |        1143|
89	|9  |DET  |Andre Drummond   |        1130|
90	|2  |BOS  |Isaiah Thomas    |        1101|
91	|4  |CHA  |Al Jefferson     |        1080|
92	|27 |SAN  |Tim Duncan       |        1070|
93	|17 |MIL  |Khris Middleton  |        1055|
94	|20 |NYK  |Carmelo Anthony  |         966|
95	|12 |IND  |C.j. Miles       |         942|
96	|23 |PHI  |Robert Covington |         927|
97	|14 |LAL  |Jordan Hill      |         841|
98	
99	3.各隊最有效率的球員
100	----------
101	各隊最有效率的球員(總得分/出戰分鐘數 最高)
102	``` r
103	
104	```
105	
106	4.各隊三分球出手最準的球員
107	----------
108	各隊三分球出手最準的球員(ThreesMade/ThreesAttempted 最高)
109	``` r
110	
111	```

