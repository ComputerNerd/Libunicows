%include "dll_names.inc"

                    global __imp__DefWindowProcW@16
                    global DefWindowProcW
                    global _DefWindowProcW@16
                    global _Unicows_DefWindowProcW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_DefWindowProcW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DefWindowProcW@16     ; place to save the pointer
                    push dword [_Unicows_DefWindowProcW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DefWindowProcW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

DefWindowProcW:
_DefWindowProcW@16:
                    jmp [__imp__DefWindowProcW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__DefWindowProcW@16:   dd unicows_initial_stub_DefWindowProcW
_Unicows_DefWindowProcW:      dd 0
namestring_DefWindowProcW:    db 'DefWindowProcW',0
