%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__DrawTextW@20
                    global DrawTextW
                    global _DrawTextW@20
                    global _Unicows_DrawTextW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_DrawTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DrawTextW@20     ; place to save the pointer
                    push dword [_Unicows_DrawTextW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DrawTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

DrawTextW:
_DrawTextW@20:
                    jmp [__imp__DrawTextW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__DrawTextW@20:   dd unicows_initial_stub_DrawTextW
_Unicows_DrawTextW:      dd 0
namestring_DrawTextW:    db 'DrawTextW',0
