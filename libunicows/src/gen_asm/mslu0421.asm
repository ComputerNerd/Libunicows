%include "dll_names.inc"

                    global __imp__lstrcmpW@8
                    global lstrcmpW
                    global _lstrcmpW@8
                    global _Unicows_lstrcmpW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_lstrcmpW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__lstrcmpW@8     ; place to save the pointer
                    push dword [_Unicows_lstrcmpW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_lstrcmpW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

lstrcmpW:
_lstrcmpW@8:
                    jmp [__imp__lstrcmpW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__lstrcmpW@8:   dd unicows_initial_stub_lstrcmpW
_Unicows_lstrcmpW:      dd 0
namestring_lstrcmpW:    db 'lstrcmpW',0
