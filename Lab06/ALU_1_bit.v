module ALU_1_bit
(
  input a,
  input b,  
  input [3:0]ALUOp,
  input CarryIn,
  output reg CarryOut,
  output reg Result
);
  wire mux1out;
  assign mux1out = ALUOp[3]?~a:a;
  wire mux2out;
  assign mux2out = ALUOp[2]?~b:b;
  always @ (*)
    begin
      assign CarryOut = ALUOp[1]?(mux1out & CarryIn) | (mux2out & CarryIn) | (mux1out & mux2out):0;
      case ({ALUOp[1:0]})
        2'b00: Result <= mux1out & mux2out;
        2'b01 : Result  <= mux1out | mux2out;
        default : Result <= (mux1out & ~mux2out & ~CarryIn) | (~mux1out & mux2out & ~CarryIn) | (~mux1out & ~mux2out & CarryIn) | (mux1out & mux2out & CarryIn);
      endcase
    end
endmodule
        
       //(a & ~b & ~CarryIn) | (~a & b & ~CarryIn) | (~a & ~b & CarryIn) | (a & b & CarryIn);  
  
  
  
  