%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RasConnectionNotificationW@12
                    global RasConnectionNotificationW
                    global _RasConnectionNotificationW@12
                    global _Unicows_RasConnectionNotificationW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RasConnectionNotificationW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasConnectionNotificationW@12     ; place to save the pointer
                    push dword [_Unicows_RasConnectionNotificationW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasConnectionNotificationW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RasConnectionNotificationW:
_RasConnectionNotificationW@12:
                    jmp [__imp__RasConnectionNotificationW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RasConnectionNotificationW@12:   dd unicows_initial_stub_RasConnectionNotificationW
_Unicows_RasConnectionNotificationW:      dd 0
namestring_RasConnectionNotificationW:    db 'RasConnectionNotificationW',0
