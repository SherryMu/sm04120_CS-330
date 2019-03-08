vlog Data_Memory.v tbData_Memory.v
vsim -novopt work.tbData_Memory
view wave
add wave sim:/tbData_Memory/*
run 200ns
