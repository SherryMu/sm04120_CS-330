vlog tbParser.v instructionParser.v
vsim -novopt work.tbParser
view wave
add wave sim:/tbParser/*
run 600ns