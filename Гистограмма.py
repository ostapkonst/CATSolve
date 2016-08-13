f_in = open('input.txt', 'r')
f_out = open('output.txt', 'w')
in_list = list(map(int, f_in.read().split()))
max_col = max(in_list[1:])
max_col_v = max_col + 3

for I in range(max_col_v):
  if I == max_col_v - 1:
    f_out.write('-')
  else: 
    f_out.write('.')
  for H in range(in_list[0]):
    if max_col - in_list[H + 1] + 1 == I: 
      f_out.write('+---+.')
    elif I == max_col_v - 1:
      f_out.write('+---+-')
    elif max_col - in_list[H + 1] + 1 < I:
      f_out.write('|###|.')  
    else:
      f_out.write('......') 
  f_out.write('\n')    

f_in.close()
f_out.close()
