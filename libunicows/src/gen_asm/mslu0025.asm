%include "dll_names.inc"

                    global __imp__CreateEnhMetaFileW@16
                    global CreateEnhMetaFileW
                    global _CreateEnhMetaFileW@16
                    global _Unicows_CreateEnhMetaFileW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateEnhMetaFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateEnhMetaFileW@16     ; place to save the pointer
                    push dword [_Unicows_CreateEnhMetaFileW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_CreateEnhMetaFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateEnhMetaFileW:
_CreateEnhMetaFileW@16:
                    jmp [__imp__CreateEnhMetaFileW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateEnhMetaFileW@16:   dd unicows_initial_stub_CreateEnhMetaFileW
_Unicows_CreateEnhMetaFileW:      dd 0
namestring_CreateEnhMetaFileW:    db 'CreateEnhMetaFileW',0
