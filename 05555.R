if (!require('rgdal')){#for fortify()
    install.packages("rgdal");library(rgdal)
}
if (!require('rgeos')){#for fortify()
    install.packages("rgeos");library(rgeos) 
}
if (!require('maptools')){#for readShapeSpatial()
    install.packages("maptools");library(maptools) 
}
tw_new <- readShapeSpatial("Town_MOI_1041215.shp") #檔名
names(tw_new)

library(ggplot2) #for fortify(), ggplot(), ggmap()
head(tw_new$Town_ID)
tw_new.df <- fortify(tw_new, region = "T_UID") #from ggplot2 package

head(tw_new.df,10)

mydata<-data.frame(NAME_2=tw_new$T_Name, id=tw_new$T_UID,
                   prevalence=rnorm(length(tw_new$T_UID)))
head(mydata)

mydata$NAME_2<-iconv(as.character(mydata$NAME_2), #NAME_2原本是factor
                     from="big5", to = "UTF-8")
head(mydata,10)
-----
final.plot<-merge(tw_new.df,mydata,by="id",all.x=T)
head(final.plot,10) 
-----
    library(RColorBrewer) #配色用brewer.pal( 9 , "Reds" )
twcmap<-ggplot() +
    geom_polygon(data = final.plot, 
                 aes(x = long, y = lat, group = group, 
                     fill = prevalence), 
                 color = "black", size = 0.25) + 
    coord_map()+#維持地圖比例
    scale_fill_gradientn(colours = brewer.pal(9,"Reds"))+
    theme_void()+
    labs(title="Prevalence of X in Taiwan")
twcmap
if (!require('ggmap')){
    install.packages("ggmap")
    library(ggmap)#for get_map()
}
twmap <- get_map(location = 'Taiwan', zoom = 7,language = "zh-TW")
ggmap(twmap) 
if (!require('ggmap')){
    install.packages("ggmap")
    library(ggmap)#for get_map()
}
twmap <- get_map(location = 'Taiwan', zoom = 7,language = "zh-TW")
ggmap(twmap)
-----
if (!require('rgdal')){#for fortify()
    install.packages("rgdal");library(rgdal)
}
if (!require('rgeos')){#for fortify()
    install.packages("rgeos");library(rgeos) 
}
if (!require('maptools')){#for readShapeSpatial()
    install.packages("maptools");library(maptools) 
}
hw_new <- read.csv("POLIO_Incidence.csv") #檔名
names(hw_new)




    