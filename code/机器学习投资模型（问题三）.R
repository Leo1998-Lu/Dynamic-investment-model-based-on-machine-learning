mystock<-read.table("最优投资组合参数.csv",header=T,sep=",")
names(mystock)
mystock<-mystock[,-1]

#### 随机森林 ####
library(randomForest)
rf1<-randomForest(收盘~开盘+最高+最低+成交量+上周平均收益率,data=mystock[1:200,])
pred80<-predict(rf1,mystock[201:280,])
plot(mystock[201:280,4],type="l")
lines(pred80,col=2)#样本外预测


plot(mystock$收盘[1:200],type="l",lwd=1.5)
lines(rf1$predicted,col=2,lwd=1.7)#样本内预测
mean(rf1$mse)


#对比
plot(mystock$收盘[1:200],type="l",xlim = c(1,280),ylim = c(min(mystock$收盘),max(mystock$收盘)),
     xlab="交易日",ylab="收盘价")
lines(rf1$predicted,col=2)
lines(201:280,mystock[201:280,4],col=4)
lines(201:280,pred80,col="orange",lwd=2)
abline(v=201,lty=4)
text(100,135,"训练集")
text(250,135,"测试集")
rmse1<-sqrt(mean((rf1$predicted-mystock$收盘[1:200])^2))##均方根误差
rmse2<-sqrt(mean((pred80-mystock$收盘[201:280])^2))
mae1<-mean(abs(rf1$predicted-mystock$收盘[1:200]));mae1##平均绝对误差
mae2<-mean(abs(pred80-mystock$收盘[201:280]));mae2
text(100,125,paste0("RMSE:",round(rmse1,3)))
text(250,125,paste0("RMSE:",round(rmse2,3)))
text(100,130,paste0("MAE:",round(mae1,3)))
text(250,130,paste0("MAE:",round(mae2,3)))
legend("topleft",col=c(1,2,4,'orange'),lwd=c(1,1,1,2),legend = c("测试集原序列","模型样本内预测结果","测试集原序列","模型样本外预测结果"))


#Holt两参数平滑
par(mfrow=c(2,3))
#收盘价格
x.fit.close<-HoltWinters(mystock$收盘,gamma = F)
#plot(x.fit.close)
x.fore.close<-forecast(x.fit,h=252)
plot(x.fore.close,main="基于HoltWinters法的收盘股价预测")
future.close<-x.fore.close$mean

#开盘
x.fit.open<-HoltWinters(mystock$开盘,gamma = F)
#plot(x.fit.open)
x.fore.open<-forecast(x.fit.open,h=252)
plot(x.fore.open,main="基于HoltWinters法的开盘股价预测")
future.open<-x.fore.open$mean

#最高
x.fit.high<-HoltWinters(mystock$最高,gamma = F)
#plot(x.fit.high)
x.fore.high<-forecast(x.fit.high,h=252)
plot(x.fore.high,main="基于HoltWinters法的最高股价预测")
future.high<-x.fore.high$mean

#最低
x.fit.low<-HoltWinters(mystock$最低,gamma = F)
#plot(x.fit.low)
x.fore.low<-forecast(x.fit.low,h=252)
plot(x.fore.low,main="基于HoltWinters法的最低股价预测")
future.low<-x.fore.low$mean

#成交量
x.fit.vol<-HoltWinters(mystock$成交量,gamma = F)
#plot(x.fit.vol)
x.fore.vol<-forecast(x.fit.vol,h=252)
plot(x.fore.vol,main="基于HoltWinters法的成交量预测")
future.vol<-x.fore.vol$mean

#上周平均收益率
x.fit.last<-HoltWinters(mystock$上周平均收益率,gamma = F)
#plot(x.fit.last)
x.fore.last<-forecast(x.fit.last,h=252)
plot(x.fore.last,main="基于HoltWinters上周平均收益率预测")
future.last<-x.fore.last$mean



future.stock<-data.frame(开盘=future.open,最高=future.high,最低=future.low,成交量=future.vol,
                           上周平均收益率=future.last)
rf.fit<-randomForest(收盘~开盘+最高+最低+成交量+上周平均收益率,data=mystock)
rf.fit
future.pred<-predict(rf.fit,future.stock)
#未来252个交易日预测
par(mfrow=c(1,2))
plot(281:(280+252),future.pred,type="l",lwd=0.5,lty=5,xlab="交易日",ylab="收盘价")
points(281:(280+252),future.pred,col=2,pch=3,cex=0.2)
plot(c(mystock$收盘,future.pred),type="l",xlab="交易日",ylab="收盘价")
lines(281:(280+252),future.pred,type="l",col="orange",lwd=2)
abline(v=280,lty=4)
text(150,140,"历史280个交易日实际数据")
text(400,140,"未来252个交易日预测数据")

##动态投资模型
#策略：预测明日收益率为负时 卖出:0；连续0则表示空仓 预测明日收益率为正时 买入:1 连续1则表明持有
#基于模型：200-80 随机森林  #第一天默认买入 每次只买100股 只卖100股
start_money<-100*mystock$收盘[1]#初始资金
pre_nextday_in<-c(1,ifelse(diff(rf1$predicted)>0,1,0))#进行操作
length(pre_nextday_in)
profit_in<-pre_nextday_in*mystock$收盘[1:200]#持仓股价变化
strategy_in<-diff(profit_in)##大幅度变动 正时为卖出 负时为买入； 小幅度变动时 为持仓时的收益情况；0为空仓
sum(strategy_in)#溢出收益价格
all_profit_in<-(sum(strategy_in)*100+start_money)/start_money
paste0(round((all_profit_in-1)*100,3),"%")#累计综合收益率
best_act<-(max(mystock$收盘[1:200])-min(mystock$收盘[1:200]))/min(mystock$收盘[1:200])
paste0(round((best_act)*100,3),"%")#最优操作累计收益率

start_money2<-100*mystock$收盘[201]#初始资金
pre_nextday_out<-c(1,ifelse(diff(pred80)>0,1,0))#进行操作
length(pre_nextday_out)
profit_out<-pre_nextday_out*mystock$收盘[201:280]#持仓股价变化
strategy_out<-diff(profit_out)##大幅度变动 正时为卖出 负时为买入； 小幅度变动时 为持仓时的收益情况；0为空仓
sum(strategy_out)#溢出收益价格
all_profit_out<-(sum(strategy_out)*100+start_money2)/start_money2#累计综合收益率
paste0(round((all_profit_out-1)*100,3),"%")#累计综合收益率
best_act2<-(max(mystock$收盘[201:280])-min(mystock$收盘[201:280]))/min(mystock$收盘[201:280])
paste0(round((best_act2)*100,3),"%")#最优操作累计收益率

final_table<-rbind(data.frame(动态投资策略累计收益率=paste0(round((all_profit_in-1)*100,3),"%"),
                                         最优操作累计收益率=paste0(round((best_act)*100,3),"%")),
                   data.frame(动态投资策略累计收益率=paste0(round((all_profit_out-1)*100,3),"%"),
                                         最优操作累计收益率=paste0(round((best_act2)*100,3),"%")))
rownames(final_table)<-c("基于训练集预测结果","基于测试集预测结果")
final_table

library(ggplot2)
theme_set(theme_bw())

TEST<-ifelse(strategy_out>10,"买入",strategy_out)
TEST<-ifelse(TEST<10,"卖出",TEST)
TEST<-ifelse(TEST==0,"空仓",TEST)
TEST<-ifelse(TEST<10&TEST>=-10,"持有",TEST)
TEST
strategy_plot<-data.frame(time=201:280,value=c(0,strategy_out))
strategy_plot<-within(strategy_plot,{
  action<-NA
  action[value>10]<-"买入"
  action[value<=-10]<-"卖出"
  action[value==0]<-"空仓"
  action[value<=10 & value>=-9.99 &value!=0]<-"持有"
})
操作行为=strategy_plot$action
str(strategy_plot)
额度大小=abs(strategy_plot$value)/sum(strategy_plot$value)
p=qplot(x=strategy_plot$time, y=strategy_plot$value,col=操作行为,size=额度大小,xlab="交易日",ylab="")
p+geom_segment(aes(y = 0, 
                   x = strategy_plot$time, 
                   yend = strategy_plot$value, 
                   xend = strategy_plot$time), 
               color = "black",size=0.1)+theme_minimal()
table(操作行为)