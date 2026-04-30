.text
.globl uswtch
.type  uswtch, @function
uswtch:
    # args: old_esp_ptr at esp+4, new_esp at esp+8
    # (after 4 pushes below: old_esp_ptr at esp+20, new_esp at esp+24)
    pushl %ebp
    pushl %ebx
    pushl %esi
    pushl %edi

    movl  20(%esp), %eax
    movl  %esp, (%eax)

    movl  24(%esp), %esp

    popl %edi
    popl %esi
    popl %ebx
    popl %ebp
    ret