%include "dll_names.inc"

                    global __imp__GetMetaFileW@4
                    global GetMetaFileW
                    global _GetMetaFileW@4
                    global _Unicows_GetMetaFileW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetMetaFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetMetaFileW@4     ; place to save the pointer
                    push dword [_Unicows_GetMetaFileW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetMetaFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetMetaFileW:
_GetMetaFileW@4:
                    jmp [__imp__GetMetaFileW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetMetaFileW@4:   dd unicows_initial_stub_GetMetaFileW
_Unicows_GetMetaFileW:      dd 0
namestring_GetMetaFileW:    db 'GetMetaFileW',0
