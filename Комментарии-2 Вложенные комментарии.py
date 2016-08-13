import re

def stripcomments(text):
    st = text
    R = re.compile('/\*([^/]|/[^\*])*?\*/')
    while R.search(st) != None:
        st = R.sub('', st)
    st = re.sub('/\*.*', '', st)
    return st

f_in = open('input.txt', 'r') 
f_out = open('output.txt', 'w') 

f_out.write(stripcomments(f_in.read()))

f_in.close() 
f_out.close()  
#'/\*([^/]|/[^\*])*?\*/'
#'/\*([^/]|/(?!\*))*?\*/'
#r = re.sub('(/\*(?!.*/\*.*\*/).*?\*/)|(/\*.*?$)', '', text, re.DOTALL)'
#print (re.search(r, s).group())
#print (re.match(r, s).group())

