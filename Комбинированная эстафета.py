f_in = open('input.txt', 'r')
f_out = open('output.txt', 'w')
M = [list(map(float, f_in.readline().split())) for I in range(4)]
MIN = 207360000

for I in range(4): 
  for J in range(4):
    if J == I : continue
    for K in range(4):
      if K == I or K == J : continue
      for L in range(4):
        if L == I or L == J or L == K : continue
        if MIN > (M[0][I]) + (M[1][J]) + (M[2][K]) + (M[3][L]):
          MIN = (M[0][I]) + (M[1][J]) + (M[2][K]) + (M[3][L])
          ANS = str(I + 1) + ' ' + str(J + 1) + ' ' + str(K + 1) + ' ' + str(L + 1)
          
f_out.write(ANS)          
f_in.close()
f_out.close()
