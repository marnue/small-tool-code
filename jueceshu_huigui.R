### Regression Trees
###################################################
library(rpart)
library(DMwR)
rm(data,algae,rt.4bp,rt2.bp4)
# 读入4b穷人purchase的数据，处理为时序对象
algae<-read.csv("F:/天池第二季/提取数据/AUTOARIMA/report_date_feature.csv")
rt.bp4 <- rpart(bp4 ~ .,data=algae[1:154,2:22],method="anova",minsplit=5)
rt.bp4
#prettyTree(rt.bp4)
#printcp(rt.bp4)

#rt2.bp4 <- prune(rt.bp4,cp=0.016269)
#rt2.bp4
#(rt.bp4 <- rpartXse(bp4 ~ .,data=algae[1:154,2:22],method="anova",minsplit=10))
#rpart.plot(rt2.bp4)
test4 <-algae[155:184,2:21]
predict4_4bp=predict(rt.bp4,test4)
predict4_4bp
