import pandas as pd
import numpy as np
##use file hand to import file
def get_text(file):
    fh = open(file, "r")
    data = fh.read()
    fh.close()    
    return data
    
def process_data(text_data):
    data = text_data.lower() ## all to lower case
    new_list = []
    for i in data:
        if i in 'abcdefghijklmnopqrstuvwxyz': ##keep only alphabetic char
            new_list.append(i) 
    data_s = pd.Series(new_list)
    return dict(data_s.value_counts()) ##return counted values(group by alphabetic char) as dictionary

def print_output(data_dictionary): 
    p = pd.Series(data_dictionary)
    print (p.sort_index(ascending=True)) ##print sorted result