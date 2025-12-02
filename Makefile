# Makefile for 611 Final Project

NOTEBOOK = 611final.ipynb
REPORT = report.html

all: $(REPORT)

$(REPORT): $(NOTEBOOK)
	jupyter nbconvert --to html $(NOTEBOOK) --output $(REPORT)

clean:
	rm -f $(REPORT)
	rm -rf __pycache__
	rm -rf .ipynb_checkpoints

.PHONY: all clean
