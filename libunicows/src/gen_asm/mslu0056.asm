%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RemoveFontResourceW@4
                    global RemoveFontResourceW
                    global _RemoveFontResourceW@4
                    global _Unicows_RemoveFontResourceW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RemoveFontResourceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RemoveFontResourceW@4     ; place to save the pointer
                    push dword [_Unicows_RemoveFontResourceW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_RemoveFontResourceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RemoveFontResourceW:
_RemoveFontResourceW@4:
                    jmp [__imp__RemoveFontResourceW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RemoveFontResourceW@4:   dd unicows_initial_stub_RemoveFontResourceW
_Unicows_RemoveFontResourceW:      dd 0
namestring_RemoveFontResourceW:    db 'RemoveFontResourceW',0
