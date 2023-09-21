bits 64 

FD_OUT equ 1
SYS_WRITE equ 1


section .text
    extern __errno_location
    global ft_write
    ft_write:

    mov rax, 1
    syscall
    cmp rax, 0
    jl error
    ret

    error:
    neg rax
    mov rdi, rax
    call __errno_location wrt ..plt
    mov [rax], rdi
    mov rax, -1 
    ret