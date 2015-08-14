#!/usr/bin/env python
from glob import glob
import sys

for lecture in glob("Lecture*.tex"):
    print(lecture, file=sys.stderr)
    tex = open(lecture).read()
    body = tex.split('\\maketitle')[1]
    body = body.replace('\\end{document}','')
    #body = body.replace('\\includegraphics{',
    #                    '\includegraphics[max width=0.9\textwidth]{')
    open(lecture,'w').write(body)

    
