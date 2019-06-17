transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Jhon/Documents/GIT/TP2 {C:/Users/Jhon/Documents/GIT/TP2/CALC1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jhon/Documents/GIT/TP2 {C:/Users/Jhon/Documents/GIT/TP2/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jhon/Documents/GIT/TP2 {C:/Users/Jhon/Documents/GIT/TP2/RegisterFile.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jhon/Documents/GIT/TP2 {C:/Users/Jhon/Documents/GIT/TP2/Controle.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jhon/Documents/GIT/TP2 {C:/Users/Jhon/Documents/GIT/TP2/signExtend.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jhon/Documents/GIT/TP2 {C:/Users/Jhon/Documents/GIT/TP2/Mem.v}

vlog -vlog01compat -work work +incdir+C:/Users/Jhon/Documents/GIT/TP2 {C:/Users/Jhon/Documents/GIT/TP2/tb_CALC1.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  tb_CALC1

add wave *
view structure
view signals
run 100 ns
