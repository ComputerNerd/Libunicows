%include "dll_names.inc"

                    global __imp__GetFileTitleW@12
                    global GetFileTitleW
                    global _GetFileTitleW@12
                    global _Unicows_GetFileTitleW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetFileTitleW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetFileTitleW@12     ; place to save the pointer
                    push dword [_Unicows_GetFileTitleW]      ; default proc, if any
                    push dword COMDLG32                  ; dll id
                    push dword namestring_GetFileTitleW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetFileTitleW:
_GetFileTitleW@12:
                    jmp [__imp__GetFileTitleW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetFileTitleW@12:   dd unicows_initial_stub_GetFileTitleW
_Unicows_GetFileTitleW:      dd 0
namestring_GetFileTitleW:    db 'GetFileTitleW',0
