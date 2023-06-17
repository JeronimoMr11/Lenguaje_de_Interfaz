[build-menu]
FT_00_LB=_Compile
FT_00_CM=nasm -f elf64 "%f"
FT_00_WD=
FT_01_LB=Linker
FT_01_CM=ld -m elf_x86_64 -s -o %e %e.o
FT_01_WD=
