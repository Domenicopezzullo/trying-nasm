
remove_newline:
    test r9, r9
    jz .done                ; nothing to trim

    dec r9                  ; point to last character
    mov al, [rsi + r9]      ; load the last byte

    cmp al, 0x0A            ; newline?
    je .strip
    cmp al, 0x0D            ; carriage return?
    je .strip
    jmp .done

.strip:
    mov byte [rsi + r9], 0  ; null-terminate, removing it
.done:
    ret
