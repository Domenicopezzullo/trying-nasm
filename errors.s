err_open:
	mov rdi, 2
	mov rsi, open_msg
	mov rdx, open_msg.len
	call print
	mov rsi, 1
	call exit

err_read:
	mov rdi, 2
	mov rsi, read_msg
	mov rdx, read_msg.len
	call print
	mov rsi, 1
	call exit


section .data

read_msg: db "Error: could not read from file", 10
	.len equ $ - read_msg

open_msg: db "Error: could not open file", 10
	.len equ $ - open_msg
