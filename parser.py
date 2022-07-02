with open('source.txt') as file:
    lines= file.readlines()
    data=[[None,None,None,None,None,None] for i in range(int(lines[0]))]
    author=[]

    i=1
    j=0
    pid=''
    coa=[]
    cit=[]
    while i<int(len(lines))-1:
        if(lines[i][:2]=='#*'):
            data[j][0]=lines[i][2:-1]
        elif(lines[i][:2]=='#@'):
            l=lines[i][2:-1].split(',')
            data[j][1]=l[0]
            coa=l[1:]
        elif(lines[i][:2]=='#t'):
            data[j][2]=lines[i][2:-1]
        elif(lines[i][:2]=='#c'):
            data[j][3]=lines[i][2:-1]
        elif(lines[i][:6]=='#index'):
            pid=lines[i][6:-1]
            data[j][4]=pid
            for au in coa:
                author.append([pid,au])
        elif(lines[i][:2]=='#!'):
            data[j][5]=lines[i][2:-1]
        elif(lines[i][:2]=='#%'):
            cit.append([pid,lines[i][2:-1]])
        if(lines[i+1][:2]=='#*' or i==len(lines)-2):
            j+=1
        
        i+=1

import csv

cols = ["title","main_author","year","venue","paper_id","abstract"]
cols1=["paper_id","name"]
cols2=["paper_id","cited_paper_id"]

with open('paper.csv', 'w') as f:

    # using csv.writer method from CSV package
    write = csv.writer(f)

    write.writerow(cols)
    write.writerows(data)
    
with open('author.csv', 'w') as f:

    # using csv.writer method from CSV package
    write = csv.writer(f)

    write.writerow(cols1)
    write.writerows(author)
    
with open('citations.csv', 'w') as f:

    # using csv.writer method from CSV package
    write = csv.writer(f)

    write.writerow(cols2)
    write.writerows(cit)