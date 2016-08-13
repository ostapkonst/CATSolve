f_in = open('input.txt', 'r')
f_out = open('output.txt', 'w')
M = list(map(int, f_in.read().split()))
S = set()
I = 0
for I in range(len(M)):
    if M[I] > 0:
        S.add(M[I])
    elif M[I] < 0:
        S.discard(-1 * M[I])
    elif M[I] == 0:
        break
for item in S:
    f_out.write("%s " %item)
f_in.close()
f_out.close()
