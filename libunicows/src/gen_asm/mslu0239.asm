%include "dll_names.inc"

                    global __imp__ExtractIconW@12
                    global ExtractIconW
                    global _ExtractIconW@12
                    global _Unicows_ExtractIconW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_ExtractIconW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ExtractIconW@12     ; place to save the pointer
                    push dword [_Unicows_ExtractIconW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_ExtractIconW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

ExtractIconW:
_ExtractIconW@12:
                    jmp [__imp__ExtractIconW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__ExtractIconW@12:   dd unicows_initial_stub_ExtractIconW
_Unicows_ExtractIconW:      dd 0
namestring_ExtractIconW:    db 'ExtractIconW',0
