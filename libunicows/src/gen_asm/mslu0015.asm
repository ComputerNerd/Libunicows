%include "dll_names.inc"

                    global __imp__WNetGetResourceParentW@12
                    global _WNetGetResourceParentW@12
                    global _Unicows_WNetGetResourceParentW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WNetGetResourceParentW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetGetResourceParentW@12     ; place to save the pointer
                    push dword [_Unicows_WNetGetResourceParentW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetGetResourceParentW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WNetGetResourceParentW@12]

_WNetGetResourceParentW@12:
                    jmp [__imp__WNetGetResourceParentW@12]


                    section .data

__imp__WNetGetResourceParentW@12:   dd unicows_initial_stub_WNetGetResourceParentW
_Unicows_WNetGetResourceParentW:      dd 0
namestring_WNetGetResourceParentW:    db 'WNetGetResourceParentW',0
