vlog top_control.v tbtop_control.v
vsim -novopt work.tbtop_control
view wave
add wave sim:/tbtop_control/*
run 100ns