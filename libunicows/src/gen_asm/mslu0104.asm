%include "dll_names.inc"

                    global __imp__CallWindowProcW@20
                    global _CallWindowProcW@20
                    global _Unicows_CallWindowProcW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CallWindowProcW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CallWindowProcW@20     ; place to save the pointer
                    push dword [_Unicows_CallWindowProcW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CallWindowProcW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CallWindowProcW@20]

_CallWindowProcW@20:
                    jmp [__imp__CallWindowProcW@20]


                    section .data

__imp__CallWindowProcW@20:   dd unicows_initial_stub_CallWindowProcW
_Unicows_CallWindowProcW:      dd 0
namestring_CallWindowProcW:    db 'CallWindowProcW',0
