%include "dll_names.inc"

                    global __imp__BroadcastSystemMessageW@20
                    global _BroadcastSystemMessageW@20
                    global _Unicows_BroadcastSystemMessageW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_BroadcastSystemMessageW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__BroadcastSystemMessageW@20     ; place to save the pointer
                    push dword [_Unicows_BroadcastSystemMessageW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_BroadcastSystemMessageW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__BroadcastSystemMessageW@20]

_BroadcastSystemMessageW@20:
                    jmp [__imp__BroadcastSystemMessageW@20]


                    section .data

__imp__BroadcastSystemMessageW@20:   dd unicows_initial_stub_BroadcastSystemMessageW
_Unicows_BroadcastSystemMessageW:      dd 0
namestring_BroadcastSystemMessageW:    db 'BroadcastSystemMessageW',0
