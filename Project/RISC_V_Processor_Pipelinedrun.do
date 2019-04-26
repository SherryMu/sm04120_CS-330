vlib work
vlog Adder.v Mux.v Program_Counter.v Instruction_Memory.v instructionParser.v Control_Unit.v IDG.v Register.v ALU_Control.v ALU_64_bit.v Data_Memory.v tbRISC_V_Processor_Pipelined.v RISC_V_Processor_Pipelined.v EX_MEM.v IF_ID.v MEM_WB.v ID_EX.v 3_bit_Mux.v Forwarding_Unit.v
vsim -novopt work.tbRISC_V_Processor_Pipelined
view wave
add wave \
{sim:/tbRISC_V_Processor_Pipelined/clk }
add wave \
{sim:/tbRISC_V_Processor_Pipelined/r5pp/rf/Regs }
