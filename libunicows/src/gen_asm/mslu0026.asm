%include "dll_names.inc"

                    global __imp__CreateFontIndirectW@4
                    global CreateFontIndirectW
                    global _CreateFontIndirectW@4
                    global _Unicows_CreateFontIndirectW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateFontIndirectW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateFontIndirectW@4     ; place to save the pointer
                    push dword [_Unicows_CreateFontIndirectW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_CreateFontIndirectW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateFontIndirectW:
_CreateFontIndirectW@4:
                    jmp [__imp__CreateFontIndirectW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateFontIndirectW@4:   dd unicows_initial_stub_CreateFontIndirectW
_Unicows_CreateFontIndirectW:      dd 0
namestring_CreateFontIndirectW:    db 'CreateFontIndirectW',0
