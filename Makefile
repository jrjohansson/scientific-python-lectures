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
	ipy3-devel nbconvert --to latex --template $(TEMPLATE) $<

#all: $(LATEXFILES) buildpdf
all: latexfiles buildpdf

latexfiles:
	ipy3-devel nbconvert --to latex --template $(TEMPLATE) Lecture-0-Scientific-Computing-with-Python.ipynb
	ipy3-devel nbconvert --to latex --template $(TEMPLATE) Lecture-1-Introduction-to-Python-Programming.ipynb
	ipy3-devel nbconvert --to latex --template $(TEMPLATE) Lecture-2-Numpy.ipynb Lecture-3-Scipy.ipynb
	ipy3-devel nbconvert --to latex --template $(TEMPLATE) Lecture-4-Matplotlib.ipynb
	ipy3-devel nbconvert --to latex --template $(TEMPLATE) Lecture-5-Sympy.ipynb
	ipy3-devel nbconvert --to latex --template $(TEMPLATE) Lecture-6A-Fortran-and-C.ipynb
	ipy3-devel nbconvert --to latex --template $(TEMPLATE) Lecture-6B-HPC.ipynb
	ipy3-devel nbconvert --to latex --template $(TEMPLATE) Lecture-7-Revision-Control-Software.ipynb


buildpdf: latexfiles
	pdflatex Scientific-Computing-with-Python.tex
    
