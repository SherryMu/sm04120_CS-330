vlog Program_Counter.v Adder.v Instruction_Fetch.v Instruction_Memory.v tbInstruction_Fetch.v
vsim -novopt work.tbInstruction_Fetch
view wave
add wave sim:/tbInstruction_Fetch/*
run 200ns
