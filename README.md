# Dynamic-investment-model-based-on-machine-learning
《基于机器学习的动态投资模型》——本人在2020第三届中青杯全国大学生数学建模赛B题本科生组全国一等奖（3%）的解决方案及过程代码，此次同样是全程独立完成所有内容，但这次并没挂老师、同学名字，因为报名费比较少，觉得没必要另找同学分摊或是挂老师名字报销（其实也是被白嫖怕了....）。

# 解决方案 Solution
对于问题一，首先提取出十支股票中的异常数据，基于R编程软件中的auto.arima函数对相应的参数序列进行时间序列建模，基于对应模型对异常数据的交易日拟合出合理的预测值并替补异常数据。然后通过各股票的关键指标（年化收益率、年化收益波动率、累计收益率等）进行对比分析来初步判断各成分股的优劣性。最终基于Markowitz(1952)的投资组合理论利用计算机通过蒙特卡洛模拟方法找出了最优投资组合方案。

![images]()

对于问题二，通过累计收益率、超额收益率、夏普指数、期望损失（ES）、最大撤回率等评估指标来对问题一中的最优投资组合进行评估分析，并将等权分配的投资组合和最低风险投资组合作为基准方案与其进行对比分析。最终通过基于机器学习的灵敏度分析量化了投资组合收益率与波动率的关系，找到了投资组合收益率与波动率的最佳组合，即在波动率相对低时收益率最高的投资组合，为模型的改进提供了方向。

![images]()

对于问题三，通过对比机器学习中的随机森林算法和时间序列模型中的Holt-Winters指数平滑法两种方法对未来交易日股价预测的精准度与合理性，最终通过随机森林模型与各股票参数序列的序列相关性建立了未来交易日股价预测模型。基于该模型进一步制定动态投资策略，在事件周期中基于该投资策略的操作行为计算出最终的累计收益率并与该事件周期中最优操作得到的累计收益率进行对比。最终得到基于训练集预测结果（200个交易日）的投资策略的累计收益率高达113.604%，且十分接近对应事件周期的最优操作累计收益率（125.479%）。而基于测试集预测结果（80个交易日）的投资策略的累计收益率为7.573%，同时该事件周期的最优操作累计收益率为22.26%。因此该动态投资模型具有一定的参考价值与较可观的收益效能。

![images]()

# 总结 Conclusion
基于**马科维茨的经典投资理论**，利用蒙特卡洛模拟方法找到10支股票的最优配置权重并找到了最优组合（收益率最大化），通过机器学习模型找到了投资组合收益率与波动率的最佳阈值范围，该最优组合的年化夏普指数达到了2.3295。基于该最优组合结合自定义的投资规则构建了动态模型，最终在200个交易日的训练集得到了**113.6%的累计收益率**（最佳操作情况下为125.4%），在80个交易日的测试集上的**累计收益率达到了7.5%**（最佳操作情况下为22.2%）

*Based on Markowitz’s classic investment theory, the Monte Carlo simulation method is used to find the optimal allocation weight of 10 stocks and find the optimal combination (return rate maximization), and find the optimal threshold range of the portfolio return rate and volatility through the machine learning model, the annualized Sharpe index of the optimal combination reaches 2.3295. Based on the optimal combination and custom investment rules, I constructed a dynamic model. Finally, a cumulative return rate of 113.6% was obtained on the training set of 200 trading days (125.4% under the best operating conditions). The cumulative return on the test set reached 7.5% (22.2% under best operating conditions)*

# 结果 Result
没白费自己熬夜三天三夜做完，拿了一等，还给了个奖章就很舒服:)

![images]()

![images]()

