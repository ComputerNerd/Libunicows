%include "dll_names.inc"

                    global __imp__RegUnLoadKeyW@8
                    global _RegUnLoadKeyW@8
                    global _Unicows_RegUnLoadKeyW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegUnLoadKeyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegUnLoadKeyW@8     ; place to save the pointer
                    push dword [_Unicows_RegUnLoadKeyW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegUnLoadKeyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegUnLoadKeyW@8]

_RegUnLoadKeyW@8:
                    jmp [__imp__RegUnLoadKeyW@8]


                    section .data

__imp__RegUnLoadKeyW@8:   dd unicows_initial_stub_RegUnLoadKeyW
_Unicows_RegUnLoadKeyW:      dd 0
namestring_RegUnLoadKeyW:    db 'RegUnLoadKeyW',0
