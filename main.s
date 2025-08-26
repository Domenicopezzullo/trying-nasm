global _start

%include "errors.s"

section .text

%include "utils.s"
%include "syscalls.s"

_start:
	mov rsi, msg
	mov rdx, msg.len
	call print ; print

	mov rdi, 0
	mov rsi, file_name
	mov rdx, 100
	call read ; read
	mov r9, rax
	cmp rax, 0
	jle err_read
	call remove_newline

	mov rdi, file_name
	call open
	cmp rax, 0
	js err_open
	mov r8, rax

	mov rdi, r8
	mov rsi, buffer
	mov rdx, 1023
	call read
	cmp rax, 0
	js err_read
	mov r10, rax

	mov rdi, r8
	call close

	mov rsi, buffer
	mov rdx, r10
	call print

	mov rdi, 0
	call exit


section .data

msg: db "Type in your file: ",
	.len equ $ - msg

section .bss

file_name resb 101
buffer resb 1024
