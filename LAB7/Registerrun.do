vlog Register.v tbRegister.v
vsim -novopt work.tbRegister
view wave
add wave sim:/tbRegister/*
run 40ns
