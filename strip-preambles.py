#!/usr/bin/env python
from glob import glob
import sys

out = open('Scientific-Computing-with-Python.tex', 'w')
preamble = open('Preamble.tex').read()
bodies = []
end = '\\end{document}'

for lecture in glob("Lecture*.tex"):
    print("Processing:", lecture, file=sys.stderr)
    tex = open(lecture).read()
    _, body = tex.split('\\maketitle')
    body = body.replace('\\end{document}','')
    bodies.append(body)

print(preamble, file=out)
print('\\maketitle', file=out)
for body in bodies:
    print('\\newpage', file=out)
    print(body, file=out)
print(end, file=out)

