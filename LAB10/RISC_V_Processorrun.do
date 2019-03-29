vlog Adder.v Mux.v Program_Counter.v Instruction_Memory.v instructionParser.v Control_Unit.v IDG.v Register.v ALU_Control.v ALU_64_bit.v Data_Memory.v tbRISC_V_Processor.v RISC_V_Processor.v
vsim -novopt work.tbRISC_V_Processor
view wave
add wave sim:/tbRISC_V_Processor/*
run 80ns