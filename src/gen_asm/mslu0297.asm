%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__ReplaceTextW@4
                    global ReplaceTextW
                    global _ReplaceTextW@4
                    global _Unicows_ReplaceTextW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_ReplaceTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ReplaceTextW@4     ; place to save the pointer
                    push dword [_Unicows_ReplaceTextW]      ; default proc, if any
                    push dword COMDLG32                  ; dll id
                    push dword namestring_ReplaceTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

ReplaceTextW:
_ReplaceTextW@4:
                    jmp [__imp__ReplaceTextW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__ReplaceTextW@4:   dd unicows_initial_stub_ReplaceTextW
_Unicows_ReplaceTextW:      dd 0
namestring_ReplaceTextW:    db 'ReplaceTextW',0
