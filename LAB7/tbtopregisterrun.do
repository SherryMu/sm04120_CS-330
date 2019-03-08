vlog Register.v instructionParser.v topRegister.v tbtopRegister.v
vsim -novopt work.tbtopRegister
view wave
add wave sim:/tbtopRegister/*
run 200ns
