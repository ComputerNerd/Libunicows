%include "dll_names.inc"

                    global __imp__OutputDebugStringW@4
                    global OutputDebugStringW
                    global _OutputDebugStringW@4
                    global _Unicows_OutputDebugStringW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_OutputDebugStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OutputDebugStringW@4     ; place to save the pointer
                    push dword [_Unicows_OutputDebugStringW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_OutputDebugStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

OutputDebugStringW:
_OutputDebugStringW@4:
                    jmp [__imp__OutputDebugStringW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__OutputDebugStringW@4:   dd unicows_initial_stub_OutputDebugStringW
_Unicows_OutputDebugStringW:      dd 0
namestring_OutputDebugStringW:    db 'OutputDebugStringW',0
