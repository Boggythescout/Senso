onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_counter/clk
add wave -noupdate /tb_counter/res_n
add wave -noupdate /tb_counter/res_score
add wave -noupdate /tb_counter/inc_score
add wave -noupdate /tb_counter/res_step
add wave -noupdate /tb_counter/inc_step
add wave -noupdate /tb_counter/an
add wave -noupdate /tb_counter/seg
add wave -noupdate /tb_counter/uut/score/zaehler/score
add wave -noupdate /tb_counter/uut/step/zaehler/score
add wave -noupdate /tb_counter/equal
add wave -noupdate /tb_counter/dp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {413032 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {2957312 ps}
