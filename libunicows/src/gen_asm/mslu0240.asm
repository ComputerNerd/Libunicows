%include "dll_names.inc"

                    global __imp__FindExecutableW@12
                    global _FindExecutableW@12
                    global _Unicows_FindExecutableW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_FindExecutableW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FindExecutableW@12     ; place to save the pointer
                    push dword [_Unicows_FindExecutableW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_FindExecutableW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__FindExecutableW@12]

_FindExecutableW@12:
                    jmp [__imp__FindExecutableW@12]


                    section .data

__imp__FindExecutableW@12:   dd unicows_initial_stub_FindExecutableW
_Unicows_FindExecutableW:      dd 0
namestring_FindExecutableW:    db 'FindExecutableW',0
