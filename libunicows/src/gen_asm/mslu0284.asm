%include "dll_names.inc"

                    global __imp__GetOpenFileNameW@4
                    global GetOpenFileNameW
                    global _GetOpenFileNameW@4
                    global _Unicows_GetOpenFileNameW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetOpenFileNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetOpenFileNameW@4     ; place to save the pointer
                    push dword [_Unicows_GetOpenFileNameW]      ; default proc, if any
                    push dword COMDLG32                  ; dll id
                    push dword namestring_GetOpenFileNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetOpenFileNameW:
_GetOpenFileNameW@4:
                    jmp [__imp__GetOpenFileNameW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetOpenFileNameW@4:   dd unicows_initial_stub_GetOpenFileNameW
_Unicows_GetOpenFileNameW:      dd 0
namestring_GetOpenFileNameW:    db 'GetOpenFileNameW',0
