%include "dll_names.inc"

                    global __imp__LoadBitmapW@8
                    global LoadBitmapW
                    global _LoadBitmapW@8
                    global _Unicows_LoadBitmapW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_LoadBitmapW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__LoadBitmapW@8     ; place to save the pointer
                    push dword [_Unicows_LoadBitmapW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_LoadBitmapW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

LoadBitmapW:
_LoadBitmapW@8:
                    jmp [__imp__LoadBitmapW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__LoadBitmapW@8:   dd unicows_initial_stub_LoadBitmapW
_Unicows_LoadBitmapW:      dd 0
namestring_LoadBitmapW:    db 'LoadBitmapW',0
