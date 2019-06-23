transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Jhon/Documents/GIT/TP2/Quartus {C:/Users/Jhon/Documents/GIT/TP2/Quartus/CALC1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jhon/Documents/GIT/TP2/Quartus {C:/Users/Jhon/Documents/GIT/TP2/Quartus/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jhon/Documents/GIT/TP2/Quartus {C:/Users/Jhon/Documents/GIT/TP2/Quartus/RegisterFile.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jhon/Documents/GIT/TP2/Quartus {C:/Users/Jhon/Documents/GIT/TP2/Quartus/Controle.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jhon/Documents/GIT/TP2/Quartus {C:/Users/Jhon/Documents/GIT/TP2/Quartus/signExtend.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jhon/Documents/GIT/TP2/Quartus {C:/Users/Jhon/Documents/GIT/TP2/Quartus/Mem.v}

vlog -vlog01compat -work work +incdir+C:/Users/Jhon/Documents/GIT/TP2/Quartus {C:/Users/Jhon/Documents/GIT/TP2/Quartus/tb_CALC1.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  tb_CALC1

add wave *
view structure
view signals
run 10 ns
