#
# Build a PDF with all the notebooks 
#
.ipynb.tex:
	ipython nbconvert --to latex  $<

all: latexfiles strip buildpdf

latexfiles:
	ipython nbconvert --to latex Lecture-0-Scientific-Computing-with-Python.ipynb
	ipython nbconvert --to latex Lecture-1-Introduction-to-Python-Programming.ipynb
	ipython nbconvert --to latex Lecture-2-Numpy.ipynb 
	ipython nbconvert --to latex Lecture-3-Scipy.ipynb
	ipython nbconvert --to latex Lecture-4-Matplotlib.ipynb
	ipython nbconvert --to latex Lecture-5-Sympy.ipynb
	ipython nbconvert --to latex Lecture-6A-Fortran-and-C.ipynb
	ipython nbconvert --to latex Lecture-6B-HPC.ipynb
	ipython nbconvert --to latex Lecture-7-Revision-Control-Software.ipynb

strip:
	./strip-preambles.py

buildpdf: latexfiles
	pdflatex Scientific-Computing-with-Python.tex
    
