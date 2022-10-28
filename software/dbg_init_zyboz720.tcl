connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351B5C102A" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351B5C102A-23727093-0"}
fpga -file /home/brac24/zybo-z720-vscode-template/software/test-app/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/brac24/zybo-z720-vscode-template/software/design_1_wrapper/export/design_1_wrapper/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/brac24/zybo-z720-vscode-template/software/test-app/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/brac24/zybo-z720-vscode-template/software/test-app/Debug/test-app.elf
configparams force-mem-access 0