library(tidyverse)

dat.f <- list.files(pattern = "Couch|Active.csv")

dat.l <- list() 

for(i in dat.f){
  met.dat<- unlist(strsplit(i,"_")) 
  who <- met.dat[1] 
  activity <- gsub(".csv","",met.dat[2]) 
  dat.l[[i]]<- read_csv(i)%>%
    mutate(who=who,activity=activity) %>%
    group_by(who, activity) %>% 
    mutate(mean = mean(degC))
}
dat <- do.call(rbind,dat.l) 

dat%>%
  ggplot(aes(x=activity,y=degC))+geom_boxplot()+stat_summary(fun = "mean", geom = "point", shape = 20, size = 4, fill = "white")+facet_grid(.~who) 