%include "dll_names.inc"

                    global __imp__CreateMetaFileW@4
                    global CreateMetaFileW
                    global _CreateMetaFileW@4
                    global _Unicows_CreateMetaFileW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateMetaFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateMetaFileW@4     ; place to save the pointer
                    push dword [_Unicows_CreateMetaFileW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_CreateMetaFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateMetaFileW:
_CreateMetaFileW@4:
                    jmp [__imp__CreateMetaFileW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateMetaFileW@4:   dd unicows_initial_stub_CreateMetaFileW
_Unicows_CreateMetaFileW:      dd 0
namestring_CreateMetaFileW:    db 'CreateMetaFileW',0
