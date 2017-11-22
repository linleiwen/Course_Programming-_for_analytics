import os
import moduleB
    
    
file = os.path.join(os.getcwd(),'script01.txt')  ## get working dictory root
filename = os.path.join(os.getcwd(),'script02.txt') 

temp1 = moduleB.get_text(file) ##import file
temp2 = moduleB.get_text(filename)
temp_dic = moduleB.process_data(temp1+temp2) ##process file
moduleB.print_output(temp_dic) ##print result
