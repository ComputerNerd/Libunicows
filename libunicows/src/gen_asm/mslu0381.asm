%include "dll_names.inc"

                    global __imp__OpenFileMappingW@12
                    global _OpenFileMappingW@12
                    global _Unicows_OpenFileMappingW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_OpenFileMappingW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OpenFileMappingW@12     ; place to save the pointer
                    push dword [_Unicows_OpenFileMappingW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_OpenFileMappingW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__OpenFileMappingW@12]

_OpenFileMappingW@12:
                    jmp [__imp__OpenFileMappingW@12]


                    section .data

__imp__OpenFileMappingW@12:   dd unicows_initial_stub_OpenFileMappingW
_Unicows_OpenFileMappingW:      dd 0
namestring_OpenFileMappingW:    db 'OpenFileMappingW',0
