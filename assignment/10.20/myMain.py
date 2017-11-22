#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct 19 16:41:42 2017

@author: drk
"""

import myModule

print ("This is myMain.py")

import os
filename = os.path.join(os.getcwd(),'datafile.txt') 
 
myList = myModule.get_input(filename)    
myMean = myModule.getMean(myList)
mySD = myModule.getSD(myList)
#myModule.print_output(myList, myMean, mySD)
