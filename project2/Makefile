PROBLEM_1_TEX=GP2_Problem1_Group\ 26.tex
PROBLEM_2_TEX=GP2_Problem2_Group\ 26.tex
PROBLEM_3_TEX=GP2_Problem3_Group\ 26.tex

all: problem1 problem2 problem3

problem1: $(PROBLEM_1_TEX)
	xelatex "$<"

problem2: $(PROBLEM_2_TEX)
	xelatex "$<"

problem3: $(PROBLEM_3_TEX)
	xelatex "$<"

clean:
	rm *.aux *.log *.pdf *.synctex*
