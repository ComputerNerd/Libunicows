%include "dll_names.inc"

                    global __imp__MapVirtualKeyW@8
                    global _MapVirtualKeyW@8
                    global _Unicows_MapVirtualKeyW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_MapVirtualKeyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__MapVirtualKeyW@8     ; place to save the pointer
                    push dword [_Unicows_MapVirtualKeyW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_MapVirtualKeyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__MapVirtualKeyW@8]

_MapVirtualKeyW@8:
                    jmp [__imp__MapVirtualKeyW@8]


                    section .data

__imp__MapVirtualKeyW@8:   dd unicows_initial_stub_MapVirtualKeyW
_Unicows_MapVirtualKeyW:      dd 0
namestring_MapVirtualKeyW:    db 'MapVirtualKeyW',0
