import os
import pandas as pd
import numpy as np
import moduleC


stop = pd.read_csv("stopwords.csv",header=None,squeeze= True) ##import stopword csv as pandas series
filename = 'script01.txt'
temp = moduleC.get_text(filename)
temp_dic = moduleC.process_data(temp)
temp = pd.Series(temp_dic)
mask = temp.index.isin(stop)#find word in stop words list
temp = temp[~mask]##remove stop words with mask
temp = temp.sort_values(ascending = False)
data1 = temp.to_frame()

filename = 'script02.txt'
temp = moduleC.get_text(filename)
temp_dic = moduleC.process_data(temp)
temp = pd.Series(temp_dic)
temp = temp.sort_values(ascending = False)
data2 = temp.to_frame()

data = pd.merge(data1,data2, left_index=True, right_index=True, how = "outer")

data = data.sort_values(by = "0_x", ascending = False)
data = data.fillna(0)
data
data.corr(method='pearson', min_periods=1)
data.columns = ["count_01","count_02"]
print(data)##inner join counts results with index
