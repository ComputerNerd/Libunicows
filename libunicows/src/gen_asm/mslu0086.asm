%include "dll_names.inc"

                    global __imp__CreateStdAccessibleProxyW@20
                    global _CreateStdAccessibleProxyW@20
                    global _Unicows_CreateStdAccessibleProxyW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CreateStdAccessibleProxyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateStdAccessibleProxyW@20     ; place to save the pointer
                    push dword [_Unicows_CreateStdAccessibleProxyW]      ; default proc, if any
                    push dword OLEACC                  ; dll id
                    push dword namestring_CreateStdAccessibleProxyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CreateStdAccessibleProxyW@20]

_CreateStdAccessibleProxyW@20:
                    jmp [__imp__CreateStdAccessibleProxyW@20]


                    section .data

__imp__CreateStdAccessibleProxyW@20:   dd unicows_initial_stub_CreateStdAccessibleProxyW
_Unicows_CreateStdAccessibleProxyW:      dd 0
namestring_CreateStdAccessibleProxyW:    db 'CreateStdAccessibleProxyW',0
