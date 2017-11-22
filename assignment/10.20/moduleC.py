import pandas as pd
import numpy as np
import re##regular expression library
##use file hand to import file
def get_text(file_name):
    fh = open(file_name, "r")
    data = fh.read()
    fh.close()    
    return data
    
def process_data(text_data):
    data = text_data.lower()
    data = re.sub("[^a-zA-Z0-9' ]", ' ', data) ##regular expression to remove spcial character except blank and '
    data = data.strip() ## remove first and last blank
    new_list = data.split(" ")##split string into list with blank separator 
    data_s = pd.Series(new_list)
    data_s = data_s.value_counts()##return counted values(group by unique words) as dictionary
    return dict(data_s[1:]) ## remove 'blank' counts and return result

def print_output(data_dictionary): 
    p = pd.Series(data_dictionary)
    print (p.sort_values(ascending=False)) ##print sorted result
    