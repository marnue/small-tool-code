#参数设置区
jiekuan = 150000 #贷款总额
yuelilv = 0.005  #贷款月利息
year_num = 1     #贷款年限

#计算部分
month_mt = jiekuan/(year_num*12.0)+jiekuan*yuelilv
print "每月还款额=",month_mt

all = 0
for j in range(1,year_num*12+1,1):
    month_mount = month_mt
    for i in range(j-1,0,-1):
        month_mount = month_mount*(1+yuelilv)
    print j,"month_mount =",month_mount
    all = all + month_mount

#结论部分
print "每月还的款如果都以相同月利率存入银行的话产生的总额=",all
print "借款",jiekuan,"元，",year_num,"年内还清","，每月还款额=",month_mt
print "名义上将月利率=",yuelilv,",直接成12得到加的年利率=",yuelilv*12,",实际计算转化为实际存款年整存利率=",(all-jiekuan)/float(year_num*jiekuan)
