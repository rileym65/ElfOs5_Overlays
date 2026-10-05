PROJECT = overlay

.SUFFIXES: .asm .bin .prg

$(PROJECT): overlay.bin overlay1.bin overlay2.bin
	addoverlay overlay.bin overlay1.bin 2
	addoverlay overlay.bin overlay2.bin 3

overlay.bin: overlay.asm
	asm02 -l -L overlay.asm
	link02 -e overlay.prg -o overlay.bin

.asm.prg:
	asm02 -l -L $<

.prg.bin:
	link02 $<

clean:
	-rm *.prg
	-rm *.lst
	-rm *.bin

