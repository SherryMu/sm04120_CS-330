vlog Control_Unit.v tbControl_Unit.v
vsim -novopt work.tbControl_Unit
view wave
add wave sim:/tbControl_Unit/*
run 100ns