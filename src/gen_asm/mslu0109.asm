%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__CharLowerBuffW@8
                    global CharLowerBuffW
                    global _CharLowerBuffW@8
                    global _Unicows_CharLowerBuffW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CharLowerBuffW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CharLowerBuffW@8     ; place to save the pointer
                    push dword [_Unicows_CharLowerBuffW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CharLowerBuffW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CharLowerBuffW:
_CharLowerBuffW@8:
                    jmp [__imp__CharLowerBuffW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CharLowerBuffW@8:   dd unicows_initial_stub_CharLowerBuffW
_Unicows_CharLowerBuffW:      dd 0
namestring_CharLowerBuffW:    db 'CharLowerBuffW',0
