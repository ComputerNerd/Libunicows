%include "dll_names.inc"

                    global __imp__GetVolumeInformationW@32
                    global GetVolumeInformationW
                    global _GetVolumeInformationW@32
                    global _Unicows_GetVolumeInformationW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetVolumeInformationW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetVolumeInformationW@32     ; place to save the pointer
                    push dword [_Unicows_GetVolumeInformationW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetVolumeInformationW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetVolumeInformationW:
_GetVolumeInformationW@32:
                    jmp [__imp__GetVolumeInformationW@32]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetVolumeInformationW@32:   dd unicows_initial_stub_GetVolumeInformationW
_Unicows_GetVolumeInformationW:      dd 0
namestring_GetVolumeInformationW:    db 'GetVolumeInformationW',0
