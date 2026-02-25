module tb_pipeline;

reg clk;
reg reset;

// instantiate processor
MipsPipelineTop dut(
.clk(clk),
.reset(reset)
);

// clock
always #5 clk = ~clk;

// reset
initial begin
clk = 0;
reset = 1;
#20;
reset = 0;
end

// monitor
initial begin
$display("time   PC        instruction");
$monitor("%0t   %h   %h",
$time,
dut.readPC,
dut.instructionIF);
end

// finish early (no xxxx spam)
initial begin
#300;
$finish;
end

endmodule