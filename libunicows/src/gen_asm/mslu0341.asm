%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetDriveTypeW@4
                    global GetDriveTypeW
                    global _GetDriveTypeW@4
                    global _Unicows_GetDriveTypeW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetDriveTypeW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetDriveTypeW@4     ; place to save the pointer
                    push dword [_Unicows_GetDriveTypeW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetDriveTypeW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetDriveTypeW:
_GetDriveTypeW@4:
                    jmp [__imp__GetDriveTypeW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetDriveTypeW@4:   dd unicows_initial_stub_GetDriveTypeW
_Unicows_GetDriveTypeW:      dd 0
namestring_GetDriveTypeW:    db 'GetDriveTypeW',0
