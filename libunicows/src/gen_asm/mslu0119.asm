%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__CreateDialogParamW@20
                    global CreateDialogParamW
                    global _CreateDialogParamW@20
                    global _Unicows_CreateDialogParamW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateDialogParamW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateDialogParamW@20     ; place to save the pointer
                    push dword [_Unicows_CreateDialogParamW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CreateDialogParamW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateDialogParamW:
_CreateDialogParamW@20:
                    jmp [__imp__CreateDialogParamW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateDialogParamW@20:   dd unicows_initial_stub_CreateDialogParamW
_Unicows_CreateDialogParamW:      dd 0
namestring_CreateDialogParamW:    db 'CreateDialogParamW',0
