%include "dll_names.inc"

                    global __imp__RasGetErrorStringW@12
                    global RasGetErrorStringW
                    global _RasGetErrorStringW@12
                    global _Unicows_RasGetErrorStringW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RasGetErrorStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasGetErrorStringW@12     ; place to save the pointer
                    push dword [_Unicows_RasGetErrorStringW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasGetErrorStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RasGetErrorStringW:
_RasGetErrorStringW@12:
                    jmp [__imp__RasGetErrorStringW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RasGetErrorStringW@12:   dd unicows_initial_stub_RasGetErrorStringW
_Unicows_RasGetErrorStringW:      dd 0
namestring_RasGetErrorStringW:    db 'RasGetErrorStringW',0
