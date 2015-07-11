library('forecast')
library('zoo')
library('timeDate')
rm(data,ts1,f,f1,f2,f3,f4,f5,f6,f7,f8,f9,k,k1,k2,k3,k4,k5,feature_frame,feature_test_frame)
# 读入4b穷人purchase的数据，处理为时序对象
data<-read.csv("F:/天池第二季/提取数据/AUTOARIMA/daily_4bupr.csv")
ts1<-ts(data[,2], start=0, frequency=7)
print (ts1)

#将report_date创建为星期7、月份1和节假日1共9个训练特征，R语言取余为%%
f<-read.csv("F:/天池第二季/提取数据/AUTOARIMA/report_date_feature.csv")
f1 <- f[1:154,2] #dayminth
f2 <- f[1:154,3] #holiday
f3 <- f[1:154,4] #星期
f4 <- f[1:154,5] #星期
f5 <- f[1:154,6] ##星期
f6 <- f[1:154,7] #星期
f7 <- f[1:154,8] #星期
f8 <- f[1:154,9] #星期
f9 <- f[1:154,10] #星期
f10<- f[1:154,11] #2345671表示星期


#读取银行拆借利率和余额宝收益0331-0831的154个数
#根据总赎回、总购买与Interest_O_N、Interest_1_W	Interest_2_W	Interest_1_M	
#  #Interest_3_M	Interest_6_M	Interest_9_M	Interest_1_Y	mfd_daily_yield	
#  #mfd_7daily_yield从上面这10个特征中选取最相关的特征带入
#  4bp穷人购买选取2,7,8,10,11 Interest_O_N Interest_6_M	Interest_9_M
k<-read.csv("F:/天池第二季/提取数据/AUTOARIMA/mfd_day_shareshibor.csv")
k1 <- k[1:154,2] #dayminth
k2 <- k[1:154,7] #holiday
k3 <- k[1:154,8] #星期
k4 <- k[1:154,10] #星期
k5 <- k[1:154,11] ##星期

#feature_frame <- data.frame(f1,f2,f3,f4,f5,f6,f7,f8,f9,k1,k2,k3,k4,k5)
feature_frame <- data.frame(f1,f2,f10)
# 进行模型训练
#arima_model <- arima(ts1,order=c(7,1,5),  xreg=feature_frame,method=c("CSS-ML"))
arima_model <- auto.arima(ts1,max.p=20, max.q=20, d=1, trace=T, xreg=feature_frame)
# arima_model <- auto.arima(ts1, max.p=20, max.q=20, d=2, trace=T)

# 读入purchase的银行拆借利率和余额宝收益特征，分为9月前训练特征
# 和9月后预测特征，处理为 data.frame 对象
ff1 <- f[155:184,2] #dayminth
ff2 <- f[155:184,3] #holiday
ff3 <- f[155:184,4] #星期
ff4 <- f[155:184,5] #星期
ff5 <- f[155:184,6] ##星期
ff6 <- f[155:184,7] #星期
ff7 <- f[155:184,8] #星期
ff8 <- f[155:184,9] #星期
ff9 <- f[155:184,10] #星期
ff10 <- f[155:184,11] #2345671表示星期
kk1 <- k[155:184,2] #dayminth
kk2 <- k[155:184,7] #holiday
kk3 <- k[155:184,8] #星期
kk4 <- k[155:184,10] #星期
kk5 <- k[155:184,11] ##星期
#feature_test_frame <- data.frame(ff1, ff2,ff3,ff4,ff5,ff6,ff7,ff8,ff9,kk1,kk2,kk3,kk4,kk5)
feature_test_frame <- data.frame(ff1, ff2,ff10)
print (feature_test_frame)


# 进行未来30天的预测, 这里的h参数可以不设置，因为forecast函数如果带有xreg参数
# 是根据xreg参数的长度来进行预测的
p_predict <- forecast(arima_model, xreg=feature_test_frame)

# 打印和plot来看看
plot(p_predict)
print(p_predict$mean)
head(p_predict)