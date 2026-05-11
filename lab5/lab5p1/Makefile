SRC = counter_top_tb.v counter_top.v counter.v toggle_ff.v decoder_7seg.v

all:
	iverilog -o sim $(SRC)
	vvp sim

wave:
	gtkwave counter_top_tb.vcd

clean:
	rm -f sim *.vcd