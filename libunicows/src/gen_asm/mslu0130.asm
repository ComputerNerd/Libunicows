%include "dll_names.inc"

                    global __imp__DefMDIChildProcW@16
                    global DefMDIChildProcW
                    global _DefMDIChildProcW@16
                    global _Unicows_DefMDIChildProcW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_DefMDIChildProcW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DefMDIChildProcW@16     ; place to save the pointer
                    push dword [_Unicows_DefMDIChildProcW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DefMDIChildProcW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

DefMDIChildProcW:
_DefMDIChildProcW@16:
                    jmp [__imp__DefMDIChildProcW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__DefMDIChildProcW@16:   dd unicows_initial_stub_DefMDIChildProcW
_Unicows_DefMDIChildProcW:      dd 0
namestring_DefMDIChildProcW:    db 'DefMDIChildProcW',0
