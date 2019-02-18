vlog IDG.v tbIDG.v
vsim -novopt work.tbIDG
view wave
add wave sim:/tbIDG/*
run 900ns