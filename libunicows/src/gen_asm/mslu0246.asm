%include "dll_names.inc"

                    global __imp__SHGetPathFromIDListW@8
                    global SHGetPathFromIDListW
                    global _SHGetPathFromIDListW@8
                    global _Unicows_SHGetPathFromIDListW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SHGetPathFromIDListW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SHGetPathFromIDListW@8     ; place to save the pointer
                    push dword [_Unicows_SHGetPathFromIDListW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_SHGetPathFromIDListW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SHGetPathFromIDListW:
_SHGetPathFromIDListW@8:
                    jmp [__imp__SHGetPathFromIDListW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SHGetPathFromIDListW@8:   dd unicows_initial_stub_SHGetPathFromIDListW
_Unicows_SHGetPathFromIDListW:      dd 0
namestring_SHGetPathFromIDListW:    db 'SHGetPathFromIDListW',0
