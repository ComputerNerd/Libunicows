%include "dll_names.inc"

                    global __imp__CallMsgFilterW@8
                    global _CallMsgFilterW@8
                    global _Unicows_CallMsgFilterW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CallMsgFilterW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CallMsgFilterW@8     ; place to save the pointer
                    push dword [_Unicows_CallMsgFilterW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CallMsgFilterW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CallMsgFilterW@8]

_CallMsgFilterW@8:
                    jmp [__imp__CallMsgFilterW@8]


                    section .data

__imp__CallMsgFilterW@8:   dd unicows_initial_stub_CallMsgFilterW
_Unicows_CallMsgFilterW:      dd 0
namestring_CallMsgFilterW:    db 'CallMsgFilterW',0
