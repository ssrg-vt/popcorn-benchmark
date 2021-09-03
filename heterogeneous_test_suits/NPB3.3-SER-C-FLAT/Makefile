all:
	for W in bt cg dc ep ft is lu mg sp ua; do \
		make -C $$W; \
	done

.PHONY: clean
clean:
	for W in bt cg dc ep ft is lu mg sp ua; do \
		make -C $$W clean; \
		rm -f $$W/npbparams.h; \
	done

.PHONY: S A B C
S: clean
	./setclass.sh S
A: clean
	./setclass.sh A
B: clean
	./setclass.sh B
C: clean
	./setclass.sh C

.PHONY: help
help:
	@echo "make {all | S | A | B | C | clean}"
