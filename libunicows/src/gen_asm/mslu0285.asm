%include "dll_names.inc"

                    global __imp__GetSaveFileNameW@4
                    global GetSaveFileNameW
                    global _GetSaveFileNameW@4
                    global _Unicows_GetSaveFileNameW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetSaveFileNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetSaveFileNameW@4     ; place to save the pointer
                    push dword [_Unicows_GetSaveFileNameW]      ; default proc, if any
                    push dword COMDLG32                  ; dll id
                    push dword namestring_GetSaveFileNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetSaveFileNameW:
_GetSaveFileNameW@4:
                    jmp [__imp__GetSaveFileNameW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetSaveFileNameW@4:   dd unicows_initial_stub_GetSaveFileNameW
_Unicows_GetSaveFileNameW:      dd 0
namestring_GetSaveFileNameW:    db 'GetSaveFileNameW',0
