%include "dll_names.inc"

                    global __imp__TabbedTextOutW@32
                    global _TabbedTextOutW@32
                    global _Unicows_TabbedTextOutW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_TabbedTextOutW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__TabbedTextOutW@32     ; place to save the pointer
                    push dword [_Unicows_TabbedTextOutW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_TabbedTextOutW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__TabbedTextOutW@32]

_TabbedTextOutW@32:
                    jmp [__imp__TabbedTextOutW@32]


                    section .data

__imp__TabbedTextOutW@32:   dd unicows_initial_stub_TabbedTextOutW
_Unicows_TabbedTextOutW:      dd 0
namestring_TabbedTextOutW:    db 'TabbedTextOutW',0
