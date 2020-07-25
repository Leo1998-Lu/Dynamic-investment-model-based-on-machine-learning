#####问题一#####
library(readxl)
#abc001
stock1<-read_xlsx("附件：十支股票参数.xlsx",sheet=1)
#规范数据
colnames(stock1)<-stock1[2,]
stock1<-stock1[-c(1:3),]
str(stock1)
#更改对应数据类型
dates<-as.Date(stock1$时间)
stock1<-data.frame(apply(stock1[,-1],2,as.numeric))
stock1$时间<-dates
summary(stock1)

#abc002
stock2<-read_xlsx("附件：十支股票参数.xlsx",sheet=2)
#规范数据
colnames(stock2)<-stock2[2,]
stock2<-stock2[-c(1:3),]
tail(stock2)#problem
str(stock2)
#更改对应数据类型
dates<-as.Date(stock2$时间)
stock2<-data.frame(apply(stock2[,-1],2,as.numeric))
stock2$时间<-dates
summary(stock2)

#abc003
stock3<-read_xlsx("附件：十支股票参数.xlsx",sheet=3)
#规范数据
colnames(stock3)<-stock3[2,]
stock3<-stock3[-c(1:3),]
stock3
str(stock3)
#更改对应数据类型
dates<-as.Date(stock3$时间)
stock3<-data.frame(apply(stock3[,-1],2,as.numeric))
stock3$时间<-dates
summary(stock3)

#abc004
stock4<-read_xlsx("附件：十支股票参数.xlsx",sheet=4)
#规范数据
colnames(stock4)<-stock4[2,]
stock4<-stock4[-c(1:3),]
stock4
str(stock4)
#更改对应数据类型
dates<-as.Date(stock4$时间)
stock4<-data.frame(apply(stock4[,-1],2,as.numeric))
stock4$时间<-dates
summary(stock4)

#abc005
stock5<-read_xlsx("附件：十支股票参数.xlsx",sheet=5)
#规范数据
colnames(stock5)<-stock5[2,]
stock5<-stock5[-c(1:3),]
stock5
str(stock5)
#更改对应数据类型
dates<-as.Date(stock5$时间)
stock5<-data.frame(apply(stock5[,-1],2,as.numeric))
stock5$时间<-dates
summary(stock5)

#abc006
stock6<-read_xlsx("附件：十支股票参数.xlsx",sheet=6)
#规范数据
colnames(stock6)<-stock6[2,]
stock6<-stock6[-c(1:3),]
stock6
str(stock6)
#更改对应数据类型
dates<-as.Date(stock6$时间)
stock6<-data.frame(apply(stock6[,-1],2,as.numeric))
stock6$时间<-dates
summary(stock6)

#abc007
stock7<-read_xlsx("附件：十支股票参数.xlsx",sheet=7)
#规范数据
colnames(stock7)<-stock7[2,]
stock7<-stock7[-c(1:3),]
stock7
str(stock7)
#更改对应数据类型
dates<-as.Date(stock7$时间)
stock7<-data.frame(apply(stock7[,-1],2,as.numeric))
stock7$时间<-dates
summary(stock7)

#abc008
stock8<-read_xlsx("附件：十支股票参数.xlsx",sheet=8)
#规范数据
colnames(stock8)<-stock8[2,]
stock8<-stock8[-c(1:3),]
stock8
str(stock8)
#更改对应数据类型
dates<-as.Date(stock8$时间)
stock8<-data.frame(apply(stock8[,-1],2,as.numeric))
stock8$时间<-dates
summary(stock8)

#abc009
stock9<-read_xlsx("附件：十支股票参数.xlsx",sheet=9)
#规范数据
colnames(stock9)<-stock9[2,]
stock9<-stock9[-c(1:3),]
stock9
str(stock9)
#更改对应数据类型
dates<-as.Date(stock9$时间)
stock9<-data.frame(apply(stock9[,-1],2,as.numeric))
stock9$时间<-dates
summary(stock9)

#abc010
stock10<-read_xlsx("附件：十支股票参数.xlsx",sheet=10)
#规范数据
colnames(stock10)<-stock10[2,]
stock10<-stock10[-c(1:3),]
stock10
str(stock10)
#更改对应数据类型
dates<-as.Date(stock10$时间)
stock10<-data.frame(apply(stock10[,-1],2,as.numeric))
stock10$时间<-dates
summary(stock10)


####(1)补全数据 3.26日数据
stocks<-rbind(stock1,stock2,stock3,stock4,stock5,stock6,stock7,stock8,stock9,stock10)
stocks[stocks$成交量==0,]
##auto.arima补全异常数据
library(forecast)
names(stock1)
#001
pred1<-NA
for(i in 1:5) pred1<-append(pred1,as.numeric(predict(auto.arima(stock1[-280,i],1)))[1])
pred1<-pred1[-1]
stock1[280,1:5]<-pred1

#002
pred2<-NA
for(i in 1:5) pred2<-append(pred2,as.numeric(predict(auto.arima(stock2[-280,i],1)))[1])
pred2<-pred2[-1]
stock2[280,1:5]<-pred2

#003
pred3<-NA
for(i in 1:5) pred3<-append(pred3,as.numeric(predict(auto.arima(stock3[-280,i],1)))[1])
pred3<-pred3[-1]
stock3[280,1:5]<-pred3

#004
pred4<-NA
for(i in 1:5) pred4<-append(pred4,as.numeric(predict(auto.arima(stock4[-280,i],1)))[1])
pred4<-pred4[-1]
stock4[280,1:5]<-pred4

#005
pred5<-NA
for(i in 1:5) pred5<-append(pred5,as.numeric(predict(auto.arima(stock5[-280,i],1)))[1])
pred5<-pred5[-1]
stock5[280,1:5]<-pred5

#006
pred6<-NA
for(i in 1:5) pred6<-append(pred6,as.numeric(predict(auto.arima(stock6[-280,i],1)))[1])
pred6<-pred6[-1]
stock6[280,1:5]<-pred6

#007
pred7<-NA
for(i in 1:5) pred7<-append(pred7,as.numeric(forecast(auto.arima(stock7[-280,i],1))$mean)[1])
pred7<-pred7[-1]
stock7[280,1:5]<-pred7

#008
pred8<-NA
for(i in 1:5) pred8<-append(pred8,as.numeric(predict(auto.arima(stock8[-280,i],1)))[1])
pred8<-pred8[-1]
stock8[280,1:5]<-pred8

rbind(stock1[280,1:5],stock2[280,1:5],stock3[280,1:5],stock4[280,1:5],stock5[280,1:5],
      stock6[280,1:5],stock7[280,1:5],stock8[280,1:5])#插入预测值



##收盘价对比
stocks<-rbind(stock1,stock2,stock3,stock4,stock5,stock6,stock7,stock8,stock9,stock10)
library(ggplot2)
股票<-c(rep("abc001",nrow(stock1)),
      rep("abc002",nrow(stock2)),
      rep("abc003",nrow(stock3)),
      rep("abc004",nrow(stock4)),
      rep("abc005",nrow(stock5)),
      rep("abc006",nrow(stock6)),
      rep("abc007",nrow(stock7)),
      rep("abc008",nrow(stock8)),
      rep("abc009",nrow(stock9)),
      rep("abc010",nrow(stock10)))
stocks$股票<-股票
library(lubridate)
library(dplyr)
theme_set(theme_bw())

df <- stocks

#股票分类：按收盘价格
class1<-df%>%group_by(股票)%>%filter(max(收盘)>100)
class1
class2<-df%>%group_by(股票)%>%filter(max(收盘)>50&max(收盘)<=100)
class2
class3<-df%>%group_by(股票)%>%filter(max(收盘)<=50&max(收盘)>10)
class3
class4<-df%>%group_by(股票)%>%filter(max(收盘)<=10)
class4
# plot
ggplot(df, aes(x=时间)) + 
  geom_line(aes(y=收盘, col=股票)) + 
  labs(title="十支成分股收盘价时序图", 
       subtitle="十支成分股各自在2019年1月初至2020年3月底的每日收盘价格变动", 
       caption="来源:十支股票的相关重要参数", 
       y="收盘价", 
       color="股票代码") +  # title and caption
  theme(axis.text.x = element_text(angle = 0, vjust=0.5, size = 8),  
        panel.grid.minor = element_blank()) 

ggplot(class3, aes(x=时间)) + 
  geom_line(aes(y=收盘, col=股票)) + 
  labs(title="第三类成分股收盘价时序图", 
       subtitle="第三类成分股：收盘价在10至50间的股票", 
       caption="来源:十支股票的相关重要参数", 
       y="收盘价", 
       color="股票代码") +  # title and caption
  theme(axis.text.x = element_text(angle = 0, vjust=0.5, size = 8),  
        panel.grid.minor = element_blank()) 

ggplot(class4, aes(x=时间)) + 
  geom_line(aes(y=收盘, col=股票)) + 
  labs(title="第四类成分股收盘价时序图", 
       subtitle="第四类成分股：收盘价小于10的股票", 
       caption="来源:十支股票的相关重要参数", 
       y="收盘价", 
       color="股票代码") +  # title and caption
  theme(axis.text.x = element_text(angle = 0, vjust=0.5, size = 8),  
        panel.grid.minor = element_blank()) 

#计算收益率
library(quantmod)
library(PerformanceAnalytics)
library(xts)
stock1_close<-as.xts(stock1$收盘,stock1$时间)
stock2_close<-as.xts(stock2$收盘,stock2$时间)
stock3_close<-as.xts(stock3$收盘,stock3$时间)
stock4_close<-as.xts(stock4$收盘,stock4$时间)
stock5_close<-as.xts(stock5$收盘,stock5$时间)
stock6_close<-as.xts(stock6$收盘,stock6$时间)
stock7_close<-as.xts(stock7$收盘,stock7$时间)
stock8_close<-as.xts(stock8$收盘,stock8$时间)
stock9_close<-as.xts(stock9$收盘,stock9$时间)
stock10_close<-as.xts(stock10$收盘,stock10$时间)

stock1_return<-CalculateReturns(stock1_close)[-1]
stock2_return<-CalculateReturns(stock2_close)[-1]
stock3_return<-CalculateReturns(stock3_close)[-1]
stock4_return<-CalculateReturns(stock4_close)[-1]
stock5_return<-CalculateReturns(stock5_close)[-1]
stock6_return<-CalculateReturns(stock6_close)[-1]
stock7_return<-CalculateReturns(stock7_close)[-1]
stock8_return<-CalculateReturns(stock8_close)[-1]
stock9_return<-CalculateReturns(stock9_close)[-1]
stock10_return<-CalculateReturns(stock10_close)[-1]



# Compute % Returns
stock7$收益率 <- c(0, diff(stock7$收盘)/stock7$收盘[-length(stock7$收盘)])

# abc007收益率
ggplot(stock7, aes(时间, 收益率)) + 
  geom_area() + 
  theme(axis.text.x = element_text()) + 
  labs(title="成分股收益率时序图", 
       subtitle = "以一类成分股abc007为例", 
       y="收益率", 
       caption="来源:十支股票的相关重要参数")   
stock7%>%
  group_by(年月=as.yearmon(时间))%>%
  summarise(月累计收益率=sum(收益率))

#累计收益率
stock1$收益率<-c(0,as.numeric(stock1_return))
stock1$累计收益率<-cumsum(stock1$收益率)

stock2$收益率<-c(0,as.numeric(stock2_return))
stock2$累计收益率<-cumsum(stock2$收益率)

stock3$收益率<-c(0,as.numeric(stock3_return))
stock3$累计收益率<-cumsum(stock3$收益率)

stock4$收益率<-c(0,as.numeric(stock4_return))
stock4$累计收益率<-cumsum(stock4$收益率)

stock5$收益率<-c(0,as.numeric(stock5_return))
stock5$累计收益率<-cumsum(stock5$收益率)

stock6$收益率<-c(0,as.numeric(stock6_return))
stock6$累计收益率<-cumsum(stock6$收益率)

stock7$收益率<-c(0,as.numeric(stock7_return))
stock7$累计收益率<-cumsum(stock7$收益率)

stock8$收益率<-c(0,as.numeric(stock8_return))
stock8$累计收益率<-cumsum(stock8$收益率)

stock9$收益率<-c(0,as.numeric(stock9_return))
stock9$累计收益率<-cumsum(stock9$收益率)

stock10$收益率<-c(0,as.numeric(stock10_return))
stock10$累计收益率<-cumsum(stock10$收益率)
##收益率对比
par(mfrow=c(3,3))
plot(stock1$收益率,type="l",xlab="时间轴",ylab="收益率",main="abc001")
plot(stock2$收益率,type="l",xlab="时间轴",ylab="收益率",main="abc002")
plot(stock3$收益率,type="l",xlab="时间轴",ylab="收益率",main="abc003")
plot(stock4$收益率,type="l",xlab="时间轴",ylab="收益率",main="abc004")
plot(stock5$收益率,type="l",xlab="时间轴",ylab="收益率",main="abc005")
plot(stock6$收益率,type="l",xlab="时间轴",ylab="收益率",main="abc006")
plot(stock8$收益率,type="l",xlab="时间轴",ylab="收益率",main="abc008")
plot(stock9$收益率,type="l",xlab="时间轴",ylab="收益率",main="abc009")
plot(stock10$收益率,type="l",xlab="时间轴",ylab="收益率",main="abc010")
par(mfrow=c(1,1))
##累计收益率对比
plot(stock1$累计收益率,type="l",ylim=c(-0.5,1.5),xlab="时间轴",ylab="累计收益率")
lines(stock2$累计收益率,col=2,lty=2)
lines(stock3$累计收益率,col=3,lty=3)
lines(stock4$累计收益率,col=4,lty=4)
lines(stock5$累计收益率,col=5,lty=5)
lines(stock6$累计收益率,col=6,lty=6)
lines(stock7$累计收益率,col=7,lty=7)
lines(stock8$累计收益率,col=8,lty=8)
lines(stock9$累计收益率,col=9,lty=9)
lines(stock10$累计收益率,col='grey',lty=10)
legend("topleft",col=c(1:9,"grey"),lty=1:10,legend = c(paste0("abc00",1:9),"abc010"),cex=0.7)

###各股重要指标
stocks<-rbind(stock1,stock2,stock3,stock4,stock5,stock6,stock7,stock8,stock9,stock10)
stocks$股票<-股票
stock_info<-stocks%>%
  group_by(股票)%>%
  summarise(平均年化收益率=mean(收益率)*252,年化收益波动率=sd(收益率)*sqrt(252),
                   累计收益率=sum(收益率))
stock_info
data.frame(stock_info)

###计算等权重的投资组合的预期收益率
weight =  1 / 10
equal_w_result<-mean(stock_info$平均年化收益率);equal_w_result# 计算等权重下的投资组合的预期收益率
mean(stock_info$累计收益率)
stocks_cov<-cov(data.frame(stock1$收益率,stock2$收益率,stock3$收益率,stock4$收益率,stock5$收益率,
                           stock6$收益率,stock7$收益率,stock8$收益率,stock9$收益率,stock10$收益率))*252
equal_w_vol<-sqrt(rep(weight,10)%*%stocks_cov%*%(rep(weight,10)));equal_w_vol # 计算投资组合的收益率波动率

R_mean<-stock_info$平均年化收益率
####投资组合####
# 1. 绘制可行集
Rt = c()   # 初始的投资组合收益率
Vl = c()   # 初始的投资组合收益波动率
# 生成10000个不同权重的预期收益率和收益波动率

x = replicate(10000,{runif(10,0,1)})
x = (matrix(unlist(x), nrow = 10000, ncol = 10, byrow = T))
head(x)
sum(x[1,]/sum(x[1,]))
i=1:10000
weight = x[i,]/apply(x[i,],1,sum)
head(weight)
apply(weight,1,sum)
for(i in 1:10000){
  Rt[i]=sum(weight[i,]*R_mean)
  Vl[i]=sqrt(weight[i,]%*%stocks_cov%*%weight[i,])
  Rt=c(Rt,Rt[i])
  Vl=c(Vl,(Vl[i]))
}
plot(equal_w_vol,equal_w_result,xlim=c(min(Vl),max(Vl)),ylim=c(min(Rt),max(Rt)),ylab="收益率",xlab="波动率",pch=8)
points(Vl,Rt,pch=20,col=2)
abline(h=0,lty=2)
num_low<-data.frame(Vl,Rt)%>%filter(Rt>0)
num_low<-which(Vl==min(num_low$Vl))
points(equal_w_vol,equal_w_result,pch=8)
points(Vl[num_low],Rt[num_low],pch=15,col=3)
points(Vl[which(Rt==max(Rt))],max(Rt),pch=17,col=4)
legend("topleft",col = c(1,3,4),pch=c(8,15,17),
       legend = c("等权分配下的投资组合","最低风险投资组合","最优投资组合"),cex=0.68)


##提取投资组合参数
#最低风险投资组合
low_risk_comb<-data.frame(波动率=Vl[num_low],收益率=Rt[num_low],t(data.frame(最低风险投资组合=weight[which(Vl==min(Vl)),])))
colnames(low_risk_comb)[3:12]<-c(paste0("abc00",1:9),"abc010")
round(low_risk_comb,3)
#最优投资组合
best_comb<-data.frame(波动率=Vl[which(Rt==max(Rt))],
                         收益率=max(Rt),t(data.frame(最优投资组合=weight[which(Rt==max(Rt)),])))
colnames(best_comb)[3:12]<-c(paste0("abc00",1:9),"abc010")

#等权分配下的投资组合
equal_w_comb<-data.frame(equal_w_vol,equal_w_result,t(rep(0.1,10)))
colnames(equal_w_comb)<-colnames(best_comb)
rownames(equal_w_comb)<-"等权分配下的投资组合"
rbind(best_comb,low_risk_comb,equal_w_comb)
comb_result<-round(rbind(equal_w_comb,low_risk_comb,best_comb),3);comb_result
comb_result

#####问题二#####
returns<-data.frame(stock1$收益率,stock2$收益率,stock3$收益率,stock4$收益率,stock5$收益率,
                    stock6$收益率,stock7$收益率,stock8$收益率,stock9$收益率,stock10$收益率)
#最优投资组合
comb_1<-Return.portfolio(as.xts(returns,stock3$时间),weights = weight[which(Rt==max(Rt)),])
plot(cumsum(comb_1),main="各投资组合累计收益率",col=4,lwd=1)
#最低风险投资组合
comb_2<-Return.portfolio(as.xts(returns,stock3$时间),weights = weight[which(Vl==Vl[num_low]),])
lines(cumsum(comb_2),col=3)

#等权分配下的投资组合
comb_3<-Return.portfolio(as.xts(returns,stock3$时间),weights = rep(0.1,10))
lines(cumsum(comb_3),col=1)

#夏普比率是通过将平均超额收益减去无风险利率，然后除以波动率得出的
comb_table<-t(cbind(table.AnnualizedReturns(comb_1),table.AnnualizedReturns(comb_2),table.AnnualizedReturns(comb_3)))
rownames(comb_table)<-c("最优投资组合","最低风险投资组合","等权分配下的投资组合")
comb_table

##超额收益率计算*
market_return<-apply(data.frame(stock1$收益率,stock2$收益率,stock3$收益率,stock4$收益率,stock5$收益率,
                                stock6$收益率,stock7$收益率,stock8$收益率,stock9$收益率,stock10$收益率),1,mean)
#市场收益率（十支股票当日平均收益率)
mean(comb_1-market_return)#平均超额收益
ex_sum1<-sum(comb_1-market_return)#累计超额收益率
ex_sum2<-sum(comb_2-market_return)
mean(comb_2-market_return)
ex_sum3<-sum(comb_3-market_return)
mean(comb_3-market_return)

m1<-data.frame(期望损失=t(ES(comb_1,p=0.95,method="historical")),最大回撤=maxDrawdown(comb_1,geometric = TRUE),
                   平均超额收益=mean(comb_1-market_return))
m2<-data.frame(期望损失=t(ES(comb_2,p=0.95,method="historical")),最大回撤=maxDrawdown(comb_2,geometric = TRUE),
                   平均超额收益=mean(comb_2-market_return))
m3<-data.frame(期望损失=t(ES(comb_3,p=0.95,method="historical")),最大回撤=maxDrawdown(comb_3,geometric = TRUE),
                   平均超额收益=mean(comb_3-market_return))
round(cbind(comb_table,rbind(m1,m2,m3)),5)

##投资组合灵敏度分析
library(randomForest)
fit.test<-randomForest(Rt~Vl)
newVl<-seq(min(Vl),max(Vl),0.00001)
pred.rt<-predict(fit.test,data.frame(Vl=newVl))
testdata<-data.frame(newVl,pred.rt)
datatest<-data.frame(Vl,Rt)
library(gridExtra)
p1=ggplot(testdata,aes(newVl,pred.rt))+geom_point(col="skyblue",shape=20)+theme_minimal()+
  geom_smooth(method="loess")+xlab("波动率")+ylab("收益率")+labs(caption = "数据：基于随机森林模型的灵敏度分析结果")
p2=ggplot(datatest,aes(Vl,Rt))+geom_point(col="skyblue",shape=20)+theme_minimal()+
  geom_smooth(method="loess")+xlab("波动率")+ylab("收益率")+labs(caption = "数据：10000种投资组合结果")
grid.arrange(p1,p2,ncol=2)


#####问题三#####
##基于最优投资组合的上周平均收益率与及各股收盘价等参数进行机器学习
best_weights = weight[which(Rt==max(Rt)),]
##资产分配（市值分配）
mystock<-stock1[,-6]*best_weights[1]+stock2[,-6]*best_weights[2]+stock3[,-6]*best_weights[3]+
  stock4[,-6]*best_weights[4]+stock5[,-6]*best_weights[5]+stock6[,-6]*best_weights[6]+
  stock7[,-6]*best_weights[7]+stock8[,-6]*best_weights[8]+stock9[,-6]*best_weights[9]+
  stock10[,-6]*best_weights[10]

mystock$交易日<-1:nrow(mystock)

mystock$当日涨跌<-ifelse(mystock$收益率>=0,1,0)


#上周平均收益率(一周5个交易日)
rt_last_week<-cumsum(mystock$收益率[1:4])
for(i in 1:(nrow(mystock)-4)){
  ma5<-mean(mystock$收益率[i:(i+4)])
  rt_last_week<-append(rt_last_week,ma5)
}
mystock$上周平均收益率<-rt_last_week
#write.csv(mystock,"最优投资组合参数.csv")