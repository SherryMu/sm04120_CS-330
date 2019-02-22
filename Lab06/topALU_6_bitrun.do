vlog ALU_1_bit.v topALU_6_bit.v tbALU_6_bit.v
vsim -novopt work.tbALU_6_bit
view wave
add wave sim:/tbALU_6_bit/*
run 900ns