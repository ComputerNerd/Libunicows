%include "dll_names.inc"

                    global __imp__DdeConnectList@20
                    global _DdeConnectList@20
                    global _Unicows_DdeConnectList
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DdeConnectList:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DdeConnectList@20     ; place to save the pointer
                    push dword [_Unicows_DdeConnectList]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DdeConnectList      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DdeConnectList@20]

_DdeConnectList@20:
                    jmp [__imp__DdeConnectList@20]


                    section .data

__imp__DdeConnectList@20:   dd unicows_initial_stub_DdeConnectList
_Unicows_DdeConnectList:      dd 0
namestring_DdeConnectList:    db 'DdeConnectList',0
