%include "dll_names.inc"

                    global __imp__DispatchMessageW@4
                    global DispatchMessageW
                    global _DispatchMessageW@4
                    global _Unicows_DispatchMessageW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_DispatchMessageW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DispatchMessageW@4     ; place to save the pointer
                    push dword [_Unicows_DispatchMessageW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DispatchMessageW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

DispatchMessageW:
_DispatchMessageW@4:
                    jmp [__imp__DispatchMessageW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__DispatchMessageW@4:   dd unicows_initial_stub_DispatchMessageW
_Unicows_DispatchMessageW:      dd 0
namestring_DispatchMessageW:    db 'DispatchMessageW',0
