module IF_ID_reg(PCplus4 ,instrIn ,instrOut ,clk ,hold,PCplus4Out,IF_flush);

  input wire [31:0] instrIn,PCplus4;
  input clk ,hold,IF_flush;
  output reg [31:0] instrOut, PCplus4Out;

 always @(posedge clk)
begin
  if (IF_flush)
    begin
      instrOut <= 32'b0;
      PCplus4Out <= PCplus4;
    end
  else if (~hold)
    begin
      instrOut <= instrIn;
      PCplus4Out <= PCplus4;
    end

      
    end
  
endmodule
