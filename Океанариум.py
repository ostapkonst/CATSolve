import itertools
f_in = open('input.txt', 'r')
f_out = open('output.txt', 'w')

Des = {}
Cou = int(f_in.readline())
for I in range(Cou):
  Cou2 = int(f_in.readline())  
  M = [list(map(str, f_in.readline().split())) for Z in range(Cou2)]
  for K in M:
    if int(Des.get(str(K), 0)) < M.count(K):
      Des[str(K)] = M.count(K)
f_out.write(str(sum(Des.values())))
f_in.close()
f_out.close()

