%include "dll_names.inc"

                    global __imp__DeviceCapabilitiesW@20
                    global _DeviceCapabilitiesW@20
                    global _Unicows_DeviceCapabilitiesW
                  
                    extern _LoadUnicowsSymbol

                    section .text

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

                    ; ...and skip to it
                    jmp [__imp__DeviceCapabilitiesW@20]

_DeviceCapabilitiesW@20:
                    jmp [__imp__DeviceCapabilitiesW@20]


                    section .data

__imp__DeviceCapabilitiesW@20:   dd unicows_initial_stub_DeviceCapabilitiesW
_Unicows_DeviceCapabilitiesW:      dd 0
namestring_DeviceCapabilitiesW:    db 'DeviceCapabilitiesW',0
