%include "dll_names.inc"

                    global __imp__UpdateResourceW@24
                    global UpdateResourceW
                    global _UpdateResourceW@24
                    global _Unicows_UpdateResourceW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_UpdateResourceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__UpdateResourceW@24     ; place to save the pointer
                    push dword [_Unicows_UpdateResourceW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_UpdateResourceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

UpdateResourceW:
_UpdateResourceW@24:
                    jmp [__imp__UpdateResourceW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__UpdateResourceW@24:   dd unicows_initial_stub_UpdateResourceW
_Unicows_UpdateResourceW:      dd 0
namestring_UpdateResourceW:    db 'UpdateResourceW',0
