# -*- coding: utf-8 -*-
"""
Created on Tue Oct 24 12:24:01 2017

@author: leiwen
"""
import pandas as pd
import numpy as np
import ModuleC


stop = pd.read_csv("stopwords.csv",header=None,squeeze= True)
filename = 'script01.txt'
temp = ModuleC.get_text(filename)
temp_dic = ModuleC.process_data(temp)
temp = pd.Series(temp_dic)
mask = temp.index.isin(stop)#find stop words
temp = temp[~mask]##remove stop words
temp = temp.sort_values(ascending = False)
data1 = temp.to_frame()

filename = 'script02.txt'
temp = ModuleC.get_text(filename)
temp_dic = process_data(temp)
temp = pd.Series(temp_dic)
temp = temp.sort_values(ascending = False)
data2 = temp.to_frame()
print(pd.merge(data1,data2, left_index=True, right_index=True) .head(10))

