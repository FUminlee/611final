# Makefile for converting Jupyter notebook to HTML using the venv inside Docker

report.html: 611final.ipynb
	./venv/bin/jupyter nbconvert --to html 611final.ipynb --output report.html

clean:
	rm -f report.html

