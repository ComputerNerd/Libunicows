%include "dll_names.inc"

                    global __imp__TextOutW@20
                    global TextOutW
                    global _TextOutW@20
                    global _Unicows_TextOutW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_TextOutW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__TextOutW@20     ; place to save the pointer
                    push dword [_Unicows_TextOutW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_TextOutW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

TextOutW:
_TextOutW@20:
                    jmp [__imp__TextOutW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__TextOutW@20:   dd unicows_initial_stub_TextOutW
_Unicows_TextOutW:      dd 0
namestring_TextOutW:    db 'TextOutW',0
