# Dynamic-investment-model-based-on-machine-learning
《基于机器学习的动态投资模型》——本人在2020第三届中青杯全国大学生数学建模赛B题本科生组全国一等奖的解决方案及过程代码，此次同样是全程独立完成所有内容，但这次并没挂老师、同学名字，因为报名费比较少，觉得没必要另找同学分摊或是挂老师名字报销（其实也是被白嫖怕了....）。
*"Dynamic investment model based on machine learning"-my solution and process code in the undergraduate group of the 3rd China Youth Cup National University Mathematical Modeling Competition in 2020 (**National first prize**)*

# 解决方案 Solution
对于问题一，首先提取出十支股票中的异常数据，基于R编程软件中的auto.arima函数对相应的参数序列进行时间序列建模，基于对应模型对异常数据的交易日拟合出合理的预测值并替补异常数据。然后通过各股票的关键指标（年化收益率、年化收益波动率、累计收益率等）进行对比分析来初步判断各成分股的优劣性。最终基于Markowitz(1952)的投资组合理论利用计算机通过蒙特卡洛模拟方法找出了最优投资组合方案。

![images](https://github.com/Leo1998-Lu/Dynamic-investment-model-based-on-machine-learning/blob/master/pic/%E9%80%9A%E8%BF%87%E8%92%99%E7%89%B9%E5%8D%A1%E6%B4%9B%E6%A8%A1%E6%8B%9F10000%E6%94%AF%E6%8A%95%E8%B5%84%E7%BB%84%E5%90%88%E7%9A%84%E6%94%B6%E7%9B%8A%E7%8E%87%E4%B8%8E%E6%B3%A2%E5%8A%A8%E7%8E%87%E5%88%86%E5%B8%83%E6%95%A3%E7%82%B9%E5%9B%BE.png)

对于问题二，通过累计收益率、超额收益率、夏普指数、期望损失（ES）、最大撤回率等评估指标来对问题一中的最优投资组合进行评估分析，并将等权分配的投资组合和最低风险投资组合作为基准方案与其进行对比分析。最终通过基于机器学习的灵敏度分析量化了投资组合收益率与波动率的关系，找到了投资组合收益率与波动率的最佳组合，即在波动率相对低时收益率最高的投资组合，为模型的改进提供了方向。

![images](https://github.com/Leo1998-Lu/Dynamic-investment-model-based-on-machine-learning/blob/master/pic/%E5%9F%BA%E4%BA%8E%E9%9A%8F%E6%9C%BA%E6%A3%AE%E6%9E%97%E6%A8%A1%E5%9E%8B%E7%9A%84%E7%81%B5%E6%95%8F%E5%BA%A6%E5%88%86%E6%9E%90%E5%92%8C%E5%8E%9F%E6%A8%A1%E6%8B%9F%E7%9A%8410000%E7%A7%8D%E6%8A%95%E8%B5%84%E7%BB%84%E5%90%88%E7%BB%93%E6%9E%9C%E8%BF%9B%E8%A1%8C%E5%B2%AD%E5%9B%9E%E5%BD%92%E7%BB%93%E6%9E%9C%E5%AF%B9%E6%AF%94.png)

对于问题三，通过对比机器学习中的随机森林算法和时间序列模型中的Holt-Winters指数平滑法两种方法对未来交易日股价预测的精准度与合理性，最终通过随机森林模型与各股票参数序列的序列相关性建立了未来交易日股价预测模型。基于该模型进一步制定动态投资策略，在事件周期中基于该投资策略的操作行为计算出最终的累计收益率并与该事件周期中最优操作得到的累计收益率进行对比。最终得到基于训练集预测结果（200个交易日）的投资策略的累计收益率高达113.604%，且十分接近对应事件周期的最优操作累计收益率（125.479%）。而基于测试集预测结果（80个交易日）的投资策略的累计收益率为7.573%，同时该事件周期的最优操作累计收益率为22.26%。因此该动态投资模型具有一定的参考价值与较可观的收益效能。

![images](https://github.com/Leo1998-Lu/Dynamic-investment-model-based-on-machine-learning/blob/master/pic/%E5%9F%BA%E4%BA%8E%E9%9A%8F%E6%9C%BA%E6%A3%AE%E6%9E%97%E7%9A%84%E8%82%A1%E7%A5%A8%E6%94%B6%E7%9B%98%E4%BB%B7%E6%A0%BC%E9%A2%84%E6%B5%8B%E6%A8%A1%E5%9E%8B%E7%9A%84%E6%B5%8B%E8%AF%95%E7%BB%93%E6%9E%9C%E5%AF%B9%E6%AF%94.png)

# 总结 Conclusion
基于**马科维茨的经典投资理论**，利用蒙特卡洛模拟方法找到10支股票的最优配置权重并找到了最优组合（收益率最大化），通过机器学习模型找到了投资组合收益率与波动率的最佳阈值范围，该最优组合的年化夏普指数达到了2.3295。基于该最优组合结合自定义的投资规则构建了动态模型，最终在200个交易日的训练集得到了**113.6%的累计收益率**（最佳操作情况下为125.4%），在80个交易日的测试集上的**累计收益率达到了7.5%**（最佳操作情况下为22.2%）

*Based on Markowitz’s classic investment theory, the Monte Carlo simulation method is used to find the optimal allocation weight of 10 stocks and find the optimal combination (return rate maximization), and find the optimal threshold range of the portfolio return rate and volatility through the machine learning model, the annualized Sharpe index of the optimal combination reaches 2.3295. Based on the optimal combination and custom investment rules, I constructed a dynamic model. Finally, a cumulative return rate of 113.6% was obtained on the training set of 200 trading days (125.4% under the best operating conditions). The cumulative return on the test set reached 7.5% (22.2% under best operating conditions)*

# 结果 Result
没白费自己熬夜三天三夜做完，拿了一等，还给了个奖章就很舒服:)

![images](https://github.com/Leo1998-Lu/Dynamic-investment-model-based-on-machine-learning/blob/master/pic/National%20First%20Prize%20Medal.jpg)

![images](https://github.com/Leo1998-Lu/Dynamic-investment-model-based-on-machine-learning/blob/master/pic/National%20First%20Prize.png)

**比赛结果公示网址**http://zqb.52jingsai.com/price1.php

![images](https://github.com/Leo1998-Lu/Dynamic-investment-model-based-on-machine-learning/blob/master/pic/list.png)
