%include "dll_names.inc"

                    global __imp__FindNextFileW@8
                    global _FindNextFileW@8
                    global _Unicows_FindNextFileW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_FindNextFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FindNextFileW@8     ; place to save the pointer
                    push dword [_Unicows_FindNextFileW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_FindNextFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__FindNextFileW@8]

_FindNextFileW@8:
                    jmp [__imp__FindNextFileW@8]


                    section .data

__imp__FindNextFileW@8:   dd unicows_initial_stub_FindNextFileW
_Unicows_FindNextFileW:      dd 0
namestring_FindNextFileW:    db 'FindNextFileW',0
