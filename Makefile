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
	jupyter nbconvert --to latex --template $(TEMPLATE) $<

all: latexfiles buildpdf

latexfiles:
	for notebook in $(NOTEBOOKS) ; do \
		jupyter nbconvert --to latex --template $(TEMPLATE) $$notebook ; \
	done

buildpdf: latexfiles
	pdflatex Scientific-Computing-with-Python.tex
    
