%include "dll_names.inc"

                    global __imp__AddFontResourceW@4
                    global AddFontResourceW
                    global _AddFontResourceW@4
                    global _Unicows_AddFontResourceW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_AddFontResourceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__AddFontResourceW@4     ; place to save the pointer
                    push dword [_Unicows_AddFontResourceW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_AddFontResourceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

AddFontResourceW:
_AddFontResourceW@4:
                    jmp [__imp__AddFontResourceW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__AddFontResourceW@4:   dd unicows_initial_stub_AddFontResourceW
_Unicows_AddFontResourceW:      dd 0
namestring_AddFontResourceW:    db 'AddFontResourceW',0
