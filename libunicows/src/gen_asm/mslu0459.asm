%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__DeviceCapabilitiesW@20
                    global DeviceCapabilitiesW
                    global _DeviceCapabilitiesW@20
                    global _Unicows_DeviceCapabilitiesW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_DeviceCapabilitiesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DeviceCapabilitiesW@20     ; place to save the pointer
                    push dword [_Unicows_DeviceCapabilitiesW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_DeviceCapabilitiesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

DeviceCapabilitiesW:
_DeviceCapabilitiesW@20:
                    jmp [__imp__DeviceCapabilitiesW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__DeviceCapabilitiesW@20:   dd unicows_initial_stub_DeviceCapabilitiesW
_Unicows_DeviceCapabilitiesW:      dd 0
namestring_DeviceCapabilitiesW:    db 'DeviceCapabilitiesW',0
