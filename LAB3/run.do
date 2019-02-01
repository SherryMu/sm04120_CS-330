vlog testbench.v mux.v
vsim -novopt work.testbench
add wave \
{sim:/testbench/einzbern } 
add wave \
{sim:/testbench/von[0] } 
add wave \
{sim:/testbench/illyasviel[0] } 
add wave \
{sim:/testbench/grail[0] } 
run 300ns