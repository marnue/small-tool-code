library(DMwR)
rm(data,algae,lm.purchase,final.lm,br4)
# 读入4b穷人purchase的数据，处理为时序对象
algae<-read.csv("F:/天池第二季/提取数据/AUTOARIMA/report_date_feature.csv")
lm.purchase <- lm(ur4 ~ .,data=algae[1:154,2:22])
summary(lm.purchase)
final.lm<-step(lm.purchase)
summary(final.lm)

test4 <-algae[155:184,2:21]
br4=predict(final.lm,test4)
br4

write.csv(br4,"ur4.csv")

