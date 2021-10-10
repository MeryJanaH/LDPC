onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /top_tb/clk
add wave -noupdate -radix unsigned /top_tb/rst
add wave -noupdate -radix unsigned /top_tb/MemAdr
add wave -noupdate -radix unsigned /top_tb/count_layer
add wave -noupdate -radix hexadecimal /top_tb/LC
add wave -noupdate -radix hexadecimal /top_tb/in1
add wave -noupdate -radix hexadecimal /top_tb/in2
add wave -noupdate -radix hexadecimal -childformat {{/top_tb/out2(34) -radix sfixed} {/top_tb/out2(33) -radix sfixed} {/top_tb/out2(32) -radix sfixed} {/top_tb/out2(31) -radix sfixed} {/top_tb/out2(30) -radix sfixed} {/top_tb/out2(29) -radix sfixed} {/top_tb/out2(28) -radix sfixed} {/top_tb/out2(27) -radix sfixed} {/top_tb/out2(26) -radix sfixed} {/top_tb/out2(25) -radix sfixed} {/top_tb/out2(24) -radix sfixed} {/top_tb/out2(23) -radix sfixed} {/top_tb/out2(22) -radix sfixed} {/top_tb/out2(21) -radix sfixed} {/top_tb/out2(20) -radix sfixed} {/top_tb/out2(19) -radix sfixed} {/top_tb/out2(18) -radix sfixed} {/top_tb/out2(17) -radix sfixed} {/top_tb/out2(16) -radix sfixed} {/top_tb/out2(15) -radix sfixed} {/top_tb/out2(14) -radix sfixed} {/top_tb/out2(13) -radix sfixed} {/top_tb/out2(12) -radix sfixed} {/top_tb/out2(11) -radix sfixed} {/top_tb/out2(10) -radix sfixed} {/top_tb/out2(9) -radix sfixed} {/top_tb/out2(8) -radix sfixed} {/top_tb/out2(7) -radix sfixed} {/top_tb/out2(6) -radix sfixed} {/top_tb/out2(5) -radix sfixed} {/top_tb/out2(4) -radix sfixed} {/top_tb/out2(3) -radix sfixed} {/top_tb/out2(2) -radix sfixed} {/top_tb/out2(1) -radix sfixed} {/top_tb/out2(0) -radix sfixed}} -subitemconfig {/top_tb/out2(34) {-height 16 -radix sfixed} /top_tb/out2(33) {-height 16 -radix sfixed} /top_tb/out2(32) {-height 16 -radix sfixed} /top_tb/out2(31) {-height 16 -radix sfixed} /top_tb/out2(30) {-height 16 -radix sfixed} /top_tb/out2(29) {-height 16 -radix sfixed} /top_tb/out2(28) {-height 16 -radix sfixed} /top_tb/out2(27) {-height 16 -radix sfixed} /top_tb/out2(26) {-height 16 -radix sfixed} /top_tb/out2(25) {-height 16 -radix sfixed} /top_tb/out2(24) {-height 16 -radix sfixed} /top_tb/out2(23) {-height 16 -radix sfixed} /top_tb/out2(22) {-height 16 -radix sfixed} /top_tb/out2(21) {-height 16 -radix sfixed} /top_tb/out2(20) {-height 16 -radix sfixed} /top_tb/out2(19) {-height 16 -radix sfixed} /top_tb/out2(18) {-height 16 -radix sfixed} /top_tb/out2(17) {-height 16 -radix sfixed} /top_tb/out2(16) {-height 16 -radix sfixed} /top_tb/out2(15) {-height 16 -radix sfixed} /top_tb/out2(14) {-height 16 -radix sfixed} /top_tb/out2(13) {-height 16 -radix sfixed} /top_tb/out2(12) {-height 16 -radix sfixed} /top_tb/out2(11) {-height 16 -radix sfixed} /top_tb/out2(10) {-height 16 -radix sfixed} /top_tb/out2(9) {-height 16 -radix sfixed} /top_tb/out2(8) {-height 16 -radix sfixed} /top_tb/out2(7) {-height 16 -radix sfixed} /top_tb/out2(6) {-height 16 -radix sfixed} /top_tb/out2(5) {-height 16 -radix sfixed} /top_tb/out2(4) {-height 16 -radix sfixed} /top_tb/out2(3) {-height 16 -radix sfixed} /top_tb/out2(2) {-height 16 -radix sfixed} /top_tb/out2(1) {-height 16 -radix sfixed} /top_tb/out2(0) {-height 16 -radix sfixed}} /top_tb/out2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7563 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits fs
update
WaveRestoreZoom {0 ns} {7815 ns}
