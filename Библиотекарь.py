import itertools
f_in = open('input.txt', 'r')
f_out = open('output.txt', 'w')

Des1 = {}
Cou = int(f_in.readline())

for I in range(Cou):
  n_Subject = str(f_in.readline().strip())
  Cou2 = int(f_in.readline())
  for J in range(Cou2):
    n_Book = str(f_in.readline().strip())    
    Cou3 = int(f_in.readline()) 
    for Z in range(Cou3):
      n_Topic = str(f_in.readline().strip())
      try:
        Des1.get(n_Topic)[n_Subject] = Des1.get(n_Topic).get(n_Subject), n_Book
      except:
        Des1[n_Topic] = {n_Subject: (n_Book)}
    
Cou3 = int(f_in.readline())
for K in range(Cou3):
  n_Q = str(f_in.readline().strip())
  f_out.write('Topic: ' + n_Q + '\n')
  f_out.write('Subject: ' + str(Des1.get(n_Q).keys())[12:-3] + '\n')
  f_out.write('Books:\n')
  for I in Des1.get(n_Q).values():
    f_out.write(str(I).replace("'", "").replace(", ", "\n").replace("(", "").replace(")", "")+ '\n')
    
f_in.close()
f_out.close()

