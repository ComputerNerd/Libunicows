%include "dll_names.inc"

                    global __imp__CreateFileMappingW@24
                    global CreateFileMappingW
                    global _CreateFileMappingW@24
                    global _Unicows_CreateFileMappingW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateFileMappingW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateFileMappingW@24     ; place to save the pointer
                    push dword [_Unicows_CreateFileMappingW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CreateFileMappingW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateFileMappingW:
_CreateFileMappingW@24:
                    jmp [__imp__CreateFileMappingW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateFileMappingW@24:   dd unicows_initial_stub_CreateFileMappingW
_Unicows_CreateFileMappingW:      dd 0
namestring_CreateFileMappingW:    db 'CreateFileMappingW',0
