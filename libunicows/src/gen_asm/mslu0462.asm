%include "dll_names.inc"

                    global __imp__EnumPortsW@24
                    global _EnumPortsW@24
                    global _Unicows_EnumPortsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumPortsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumPortsW@24     ; place to save the pointer
                    push dword [_Unicows_EnumPortsW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_EnumPortsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumPortsW@24]

_EnumPortsW@24:
                    jmp [__imp__EnumPortsW@24]


                    section .data

__imp__EnumPortsW@24:   dd unicows_initial_stub_EnumPortsW
_Unicows_EnumPortsW:      dd 0
namestring_EnumPortsW:    db 'EnumPortsW',0
