%include "dll_names.inc"

                    global __imp__lstrcatW@8
                    global lstrcatW
                    global _lstrcatW@8
                    global _Unicows_lstrcatW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_lstrcatW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__lstrcatW@8     ; place to save the pointer
                    push dword [_Unicows_lstrcatW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_lstrcatW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

lstrcatW:
_lstrcatW@8:
                    jmp [__imp__lstrcatW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__lstrcatW@8:   dd unicows_initial_stub_lstrcatW
_Unicows_lstrcatW:      dd 0
namestring_lstrcatW:    db 'lstrcatW',0
