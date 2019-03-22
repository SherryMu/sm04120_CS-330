vlog ALU_Control.v tbALU_Control.v
vsim -novopt work.tbALU_Control
view wave
add wave sim:/tbALU_Control/*
run 80ns