%include "dll_names.inc"

                    global __imp__CreateScalableFontResourceW@16
                    global CreateScalableFontResourceW
                    global _CreateScalableFontResourceW@16
                    global _Unicows_CreateScalableFontResourceW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateScalableFontResourceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateScalableFontResourceW@16     ; place to save the pointer
                    push dword [_Unicows_CreateScalableFontResourceW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_CreateScalableFontResourceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateScalableFontResourceW:
_CreateScalableFontResourceW@16:
                    jmp [__imp__CreateScalableFontResourceW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateScalableFontResourceW@16:   dd unicows_initial_stub_CreateScalableFontResourceW
_Unicows_CreateScalableFontResourceW:      dd 0
namestring_CreateScalableFontResourceW:    db 'CreateScalableFontResourceW',0
