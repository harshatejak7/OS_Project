CC = i686-elf-gcc
AS = nasm
EMU = qemu-system-i386

CFLAGS = -ffreestanding -O2 -Wall
LDFLAGS = -T linker.ld -nostdlib

all: os.bin

boot.bin: boot.s
	$(AS) -f bin boot.s -o boot.bin

kernel.o: kernel.c
	$(CC) -c kernel.c -o kernel.o $(CFLAGS)

kernel.bin: kernel.o
	$(CC) $(LDFLAGS) -o kernel.bin kernel.o

os.bin: boot.bin kernel.bin
	cat boot.bin kernel.bin > os.bin

run: os.bin
	$(EMU) -drive format=raw,file=os.bin

clean:
	rm -f *.bin *.o