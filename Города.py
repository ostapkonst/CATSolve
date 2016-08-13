f_in = open('cities.in', 'r')
f_out = open('cities.out', 'w')

N = int(f_in.readline().strip())

M = [list(map(str, f_in.readline().split())) for I in range(N)]

Count = 0
for I in range(N):
  for J in range(N):
    C = str(M[I])[J+2:J+3]
    if C =='C':
      Count = Count + 1

Char = '1'

NewCount = 0
for I in range(N):
  for J in range(N):
    C = str(M[I])[J+2:J+3]
    if C == 'C':
      NewCount = NewCount + 1
      if NewCount > (Count / 2):
        Char = '2'
    f_out.write(Char)
  f_out.write('\n')     

f_in.close()
f_out.close()
