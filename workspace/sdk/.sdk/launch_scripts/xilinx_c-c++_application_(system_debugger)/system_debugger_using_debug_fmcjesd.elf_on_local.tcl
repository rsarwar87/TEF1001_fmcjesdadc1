connect -url tcp:10.211.3.140:3121
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent JTAG-HS3 210299A17B27"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent JTAG-HS3 210299A17B27"} -index 0
dow /media/2TB/workspace/rsarwar/work/TE1001_160/refdesign/test_board/workspace/sdk/fmcjesd/Debug/fmcjesd.elf
bpadd -addr &main
