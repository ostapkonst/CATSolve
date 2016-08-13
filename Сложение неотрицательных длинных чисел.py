f = open('input.txt', 'r')
line = f.readline()
a = line.strip()
line = f.readline()
b = line.strip()
#print(int(b) + int(a))
open("output.txt", "w").write(str(int(b) + int(a)))

