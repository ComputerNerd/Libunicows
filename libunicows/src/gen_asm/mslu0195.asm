%include "dll_names.inc"

                    global __imp__MapVirtualKeyExW@12
                    global _MapVirtualKeyExW@12
                    global _Unicows_MapVirtualKeyExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_MapVirtualKeyExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__MapVirtualKeyExW@12     ; place to save the pointer
                    push dword [_Unicows_MapVirtualKeyExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_MapVirtualKeyExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__MapVirtualKeyExW@12]

_MapVirtualKeyExW@12:
                    jmp [__imp__MapVirtualKeyExW@12]


                    section .data

__imp__MapVirtualKeyExW@12:   dd unicows_initial_stub_MapVirtualKeyExW
_Unicows_MapVirtualKeyExW:      dd 0
namestring_MapVirtualKeyExW:    db 'MapVirtualKeyExW',0
