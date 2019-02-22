vlog ALU_1_bit.v tbALU_1_bit.v
vsim -novopt work.tbALU_1_bit
view wave
add wave sim:/tbALU_1_bit/*
run 900ns