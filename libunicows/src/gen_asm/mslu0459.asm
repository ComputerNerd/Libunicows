%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__AddMonitorW@12
                    global AddMonitorW
                    global _AddMonitorW@12
                    global _Unicows_AddMonitorW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_AddMonitorW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__AddMonitorW@12     ; place to save the pointer
                    push dword [_Unicows_AddMonitorW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_AddMonitorW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

AddMonitorW:
_AddMonitorW@12:
                    jmp [__imp__AddMonitorW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__AddMonitorW@12:   dd unicows_initial_stub_AddMonitorW
_Unicows_AddMonitorW:      dd 0
namestring_AddMonitorW:    db 'AddMonitorW',0
