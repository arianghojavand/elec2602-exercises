SRC := $(wildcard *.v)
CC = iverilog
FLAGS = -Wall
OUT = sim

all:
	$(CC) $(FLAGS) -o $(OUT) $(SRC)
	vvp $(OUT)

wave:
	gtkwave top_tb.vcd

clean:
	rm -f $(OUT) *.vcd