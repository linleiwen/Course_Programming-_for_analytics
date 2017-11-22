# -*- coding: utf-8 -*-
"""
Created on Tue Oct 24 12:02:11 2017

@author: leiwen
"""
import pandas as pd
import numpy as np
import re##regular expression library
filename = 'script01.txt'
fh = open(filename, "r")
data = fh.read()
fh.close()
data = re.sub('[^a-zA-Z0-9\' ]', ' ', data) ##regular expression to remove spcial character
data = data.strip()
new_list = data.split(" ")
data_s = pd.Series(new_list)
data_s = data_s.value_counts().sort_values(ascending = False)
data_s[1:]
dict(data_s[mask])


data_s = pd.Series(data_s.value_counts()).sort_values(ascending = False)

p = pd.Series(data_s)
p.sort_values(ascending=False).head(10)
p = p.to_frame()









