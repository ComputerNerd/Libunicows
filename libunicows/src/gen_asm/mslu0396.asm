%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__OpenFileMappingW@12
                    global OpenFileMappingW
                    global _OpenFileMappingW@12
                    global _Unicows_OpenFileMappingW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_OpenFileMappingW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OpenFileMappingW@12     ; place to save the pointer
                    push dword [_Unicows_OpenFileMappingW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_OpenFileMappingW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

OpenFileMappingW:
_OpenFileMappingW@12:
                    jmp [__imp__OpenFileMappingW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__OpenFileMappingW@12:   dd unicows_initial_stub_OpenFileMappingW
_Unicows_OpenFileMappingW:      dd 0
namestring_OpenFileMappingW:    db 'OpenFileMappingW',0
