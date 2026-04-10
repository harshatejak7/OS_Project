; boot.asm - Simple Hello World OS (NO C, NO linker.ld)

[BITS 16]
[ORG 0x7c00]

start:
    mov si, message

print:
    lodsb               ; load character
    cmp al, 0
    je done
    mov ah, 0x0e        ; BIOS teletype
    int 0x10
    jmp print

done:
    jmp $

message db "Ronaldo is the greatest football player of all time!!!", 0

times 510-($-$$) db 0
dw 0xaa55