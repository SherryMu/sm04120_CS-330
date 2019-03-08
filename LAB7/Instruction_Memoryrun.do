vlog Instruction_Memory.v tbInstruction_Memory.v
vsim -novopt work.tbInstruction_Memory
view wave
add wave sim:/tbInstruction_Memory/*
run 100ns
