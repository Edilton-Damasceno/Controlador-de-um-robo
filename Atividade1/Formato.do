onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /Robo_TB/Mapa
add wave -noupdate /Robo_TB/Linha_Mapa
add wave -noupdate -radix unsigned /Robo_TB/Linha_Robo
add wave -noupdate -radix unsigned /Robo_TB/Coluna_Robo
add wave -noupdate /Robo_TB/Orientacao_Robo
add wave -noupdate -radix unsigned /Robo_TB/Qtd_Movimentos
add wave -noupdate -divider {Sinais de Controle}
add wave -noupdate /Robo_TB/clock
add wave -noupdate /Robo_TB/reset
add wave -noupdate -divider Entradas
add wave -noupdate /Robo_TB/head
add wave -noupdate /Robo_TB/left
add wave -noupdate -divider Saidas
add wave -noupdate -radix binary /Robo_TB/avancar
add wave -noupdate -radix binary /Robo_TB/girar
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {70 ns} 0}
quietly wave cursor active 1
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1 us}
