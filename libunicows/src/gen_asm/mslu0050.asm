%include "dll_names.inc"

                    global __imp__GetTextExtentExPointW@28
                    global GetTextExtentExPointW
                    global _GetTextExtentExPointW@28
                    global _Unicows_GetTextExtentExPointW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetTextExtentExPointW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetTextExtentExPointW@28     ; place to save the pointer
                    push dword [_Unicows_GetTextExtentExPointW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetTextExtentExPointW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetTextExtentExPointW:
_GetTextExtentExPointW@28:
                    jmp [__imp__GetTextExtentExPointW@28]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetTextExtentExPointW@28:   dd unicows_initial_stub_GetTextExtentExPointW
_Unicows_GetTextExtentExPointW:      dd 0
namestring_GetTextExtentExPointW:    db 'GetTextExtentExPointW',0
