%include "dll_names.inc"

                    global __imp__SHChangeNotify@16
                    global _SHChangeNotify@16
                    global _Unicows_SHChangeNotify
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SHChangeNotify:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SHChangeNotify@16     ; place to save the pointer
                    push dword [_Unicows_SHChangeNotify]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_SHChangeNotify      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SHChangeNotify@16]

_SHChangeNotify@16:
                    jmp [__imp__SHChangeNotify@16]


                    section .data

__imp__SHChangeNotify@16:   dd unicows_initial_stub_SHChangeNotify
_Unicows_SHChangeNotify:      dd 0
namestring_SHChangeNotify:    db 'SHChangeNotify',0
