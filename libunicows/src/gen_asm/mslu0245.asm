%include "dll_names.inc"

                    global __imp__SHGetNewLinkInfoW@20
                    global _SHGetNewLinkInfoW@20
                    global _Unicows_SHGetNewLinkInfoW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SHGetNewLinkInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SHGetNewLinkInfoW@20     ; place to save the pointer
                    push dword [_Unicows_SHGetNewLinkInfoW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_SHGetNewLinkInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SHGetNewLinkInfoW@20]

_SHGetNewLinkInfoW@20:
                    jmp [__imp__SHGetNewLinkInfoW@20]


                    section .data

__imp__SHGetNewLinkInfoW@20:   dd unicows_initial_stub_SHGetNewLinkInfoW
_Unicows_SHGetNewLinkInfoW:      dd 0
namestring_SHGetNewLinkInfoW:    db 'SHGetNewLinkInfoW',0
