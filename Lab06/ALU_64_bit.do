vlog ALU_64_bit.v tbALU_64_bit.v
vsim -novopt work.tbALU_64_bit
view wave
add wave sim:/tbALU_64_bit/*
run 300ns