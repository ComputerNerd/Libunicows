%include "dll_names.inc"

                    global __imp__GetKeyboardLayoutNameW@4
                    global GetKeyboardLayoutNameW
                    global _GetKeyboardLayoutNameW@4
                    global _Unicows_GetKeyboardLayoutNameW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetKeyboardLayoutNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetKeyboardLayoutNameW@4     ; place to save the pointer
                    push dword [_Unicows_GetKeyboardLayoutNameW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetKeyboardLayoutNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetKeyboardLayoutNameW:
_GetKeyboardLayoutNameW@4:
                    jmp [__imp__GetKeyboardLayoutNameW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetKeyboardLayoutNameW@4:   dd unicows_initial_stub_GetKeyboardLayoutNameW
_Unicows_GetKeyboardLayoutNameW:      dd 0
namestring_GetKeyboardLayoutNameW:    db 'GetKeyboardLayoutNameW',0
