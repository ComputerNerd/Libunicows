%include "dll_names.inc"

                    global __imp__RegisterDeviceNotificationW@12
                    global RegisterDeviceNotificationW
                    global _RegisterDeviceNotificationW@12
                    global _Unicows_RegisterDeviceNotificationW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegisterDeviceNotificationW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegisterDeviceNotificationW@12     ; place to save the pointer
                    push dword [_Unicows_RegisterDeviceNotificationW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_RegisterDeviceNotificationW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegisterDeviceNotificationW:
_RegisterDeviceNotificationW@12:
                    jmp [__imp__RegisterDeviceNotificationW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegisterDeviceNotificationW@12:   dd unicows_initial_stub_RegisterDeviceNotificationW
_Unicows_RegisterDeviceNotificationW:      dd 0
namestring_RegisterDeviceNotificationW:    db 'RegisterDeviceNotificationW',0
