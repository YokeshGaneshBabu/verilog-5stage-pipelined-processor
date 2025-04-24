module PC (nextPC ,outPC ,Reset ,clk, holdPC);

input wire [31:0] nextPC;
input Reset , clk, holdPC;
output reg [31:0] outPC;

always@(posedge Reset) outPC <= 32'hFFFFFFFC;
  

always @(posedge clk or posedge Reset)
begin
  if (Reset)
    outPC <= 32'hFFFFFFFC;
  else if (~holdPC)
    outPC <= nextPC;
  end

endmodule
