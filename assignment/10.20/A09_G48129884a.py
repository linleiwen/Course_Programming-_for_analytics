import os
import moduleA

file = os.path.join(os.getcwd(),'script01.txt')  ## get working dictory root
filename = os.path.join(os.getcwd(),'script02.txt') 

temp1 = moduleA.get_text(file) ##import file
temp2 = moduleA.get_text(filename)
temp_dic = moduleA.process_data(temp1+temp2) ##process file
moduleA.print_output(temp_dic) ##print result







