%include "dll_names.inc"

                    global __imp__RasEnumDevicesW@12
                    global RasEnumDevicesW
                    global _RasEnumDevicesW@12
                    global _Unicows_RasEnumDevicesW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RasEnumDevicesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasEnumDevicesW@12     ; place to save the pointer
                    push dword [_Unicows_RasEnumDevicesW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasEnumDevicesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RasEnumDevicesW:
_RasEnumDevicesW@12:
                    jmp [__imp__RasEnumDevicesW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RasEnumDevicesW@12:   dd unicows_initial_stub_RasEnumDevicesW
_Unicows_RasEnumDevicesW:      dd 0
namestring_RasEnumDevicesW:    db 'RasEnumDevicesW',0
