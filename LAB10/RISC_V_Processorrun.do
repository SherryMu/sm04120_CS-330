vlog Adder.v Mux.v Program_Counter.v Instruction_Memory.v instructionParser.v Control_Unit.v IDG.v Register.v ALU_Control.v ALU_64_bit.v Data_Memory.v tbRISC_V_Processor.v RISC_V_Processor.v
vsim -novopt work.tbRISC_V_Processor
add wave sim:/tbRISC_V_Processor/rvp/pc/*
add wave sim:/tbRISC_V_Processor/rvp/im/*
add wave sim:/tbRISC_V_Processor/rvp/add1/*
add wave sim:/tbRISC_V_Processor/rvp/mux1/*
add wave sim:/tbRISC_V_Processor/rvp/rf/Regs

view wave

run 1000ns