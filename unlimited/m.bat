cls
del unlimited.tap
del *.rel
del crt0.ihx
sdasz80 -xlos -g crt0.rel crt0.s
sdcc -c -o app.rel app.c -mz80 --no-std-crt0 --opt-code-speed --Werror --peep-asm --peep-return 
sdcc -mz80 --no-std-crt0 --opt-code-speed --nostdlib --code-loc 0xd032 --data-loc 0xf000 -Wl -b_HEADER=0xd000 crt0.rel app.rel 
..\tools\mackarel crt0.ihx unlimited.tap unlimited loader.scr -nosprestore -noei -noclear
speccy unlimited.tap
