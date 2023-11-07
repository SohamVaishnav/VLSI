import os
import subprocess
import random 
# import time

#destination file name should be written here
command = "ngspice Q5_a_temp.cir"

fp3 = open("Q5_a.txt",'w')
fp3.close()

r = random.choices(range(0, 80), k=500)

for i in range(0,100):

    #open src file and output file
    f1 = open("NAND_2.cir",'r') #source file
    f2 = open("Q5_a_temp.cir",'w') #run file/destination file
    fp3 = open("Q5_a.txt",'a') #output file

    #this can give me 100 samples
    temp = r[i]

    #reading data into a string 
    data = f1.read()

    search_text = "*temperature"
    replace_text = f".option temp={temp}\n"
    data = data.replace(search_text,replace_text)
    f1.close()

    f2.write(data)
    f2.close()

    completed_process = subprocess.run(command, shell=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if completed_process.returncode == 0:
        # Capture the standard output into a string
        output = completed_process.stdout
    else:
        output = ("Command execution failed. at temp =",temp)

    output = output.split('\n')
    output = output[-4]
    additional_text = f" for temperature = {temp}\n"
    fp3.write(output+additional_text)
    fp3.close()
    # time.sleep(0.5)
 
