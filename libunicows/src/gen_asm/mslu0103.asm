%include "dll_names.inc"

                    global __imp__CallWindowProcA@20
                    global _CallWindowProcA@20
                    global _Unicows_CallWindowProcA
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CallWindowProcA:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CallWindowProcA@20     ; place to save the pointer
                    push dword [_Unicows_CallWindowProcA]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CallWindowProcA      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CallWindowProcA@20]

_CallWindowProcA@20:
                    jmp [__imp__CallWindowProcA@20]


                    section .data

__imp__CallWindowProcA@20:   dd unicows_initial_stub_CallWindowProcA
_Unicows_CallWindowProcA:      dd 0
namestring_CallWindowProcA:    db 'CallWindowProcA',0
