#
# Build a PDF with all the notebooks 
#
TEMPLATE=chapter
NOTEBOOKS=Lecture-0-Scientific-Computing-with-Python.ipynb \
          Lecture-1-Introduction-to-Python-Programming.ipynb \
          Lecture-2-Numpy.ipynb Lecture-3-Scipy.ipynb \
          Lecture-4-Matplotlib.ipynb Lecture-5-Sympy.ipynb \
          Lecture-6A-Fortran-and-C.ipynb Lecture-6B-HPC.ipynb \
          Lecture-7-Revision-Control-Software.ipynb

LATEXFILES=$(NOTEBOOKS:.ipynb=.tex)

.ipynb.tex:
	ipython nbconvert --to latex --template $(TEMPLATE) $<

#all: $(LATEXFILES) buildpdf
all: latexfiles buildpdf

latexfiles:
	ipython nbconvert --to latex --template $(TEMPLATE) Lecture-0-Scientific-Computing-with-Python.ipynb
	ipython nbconvert --to latex --template $(TEMPLATE) Lecture-1-Introduction-to-Python-Programming.ipynb
	ipython nbconvert --to latex --template $(TEMPLATE) Lecture-2-Numpy.ipynb Lecture-3-Scipy.ipynb
	ipython nbconvert --to latex --template $(TEMPLATE) Lecture-4-Matplotlib.ipynb
	ipython nbconvert --to latex --template $(TEMPLATE) Lecture-5-Sympy.ipynb
	ipython nbconvert --to latex --template $(TEMPLATE) Lecture-6A-Fortran-and-C.ipynb
	ipython nbconvert --to latex --template $(TEMPLATE) Lecture-6B-HPC.ipynb
	ipython nbconvert --to latex --template $(TEMPLATE) Lecture-7-Revision-Control-Software.ipynb


buildpdf: latexfiles
	pdflatex Scientific-Computing-with-Python.tex
    
