%include "dll_names.inc"

                    global __imp__FatalAppExitW@8
                    global FatalAppExitW
                    global _FatalAppExitW@8
                    global _Unicows_FatalAppExitW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_FatalAppExitW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FatalAppExitW@8     ; place to save the pointer
                    push dword [_Unicows_FatalAppExitW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_FatalAppExitW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

FatalAppExitW:
_FatalAppExitW@8:
                    jmp [__imp__FatalAppExitW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__FatalAppExitW@8:   dd unicows_initial_stub_FatalAppExitW
_Unicows_FatalAppExitW:      dd 0
namestring_FatalAppExitW:    db 'FatalAppExitW',0
