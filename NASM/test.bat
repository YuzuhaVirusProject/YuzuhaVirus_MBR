@echo off
nasm -o disk.img kernel.asm
qemu-system-i386 -s -soundhw pcspk -fda disk.img
pause