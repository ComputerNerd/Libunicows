%include "dll_names.inc"

                    global __imp__mciGetDeviceIDW@4
                    global mciGetDeviceIDW
                    global _mciGetDeviceIDW@4
                    global _Unicows_mciGetDeviceIDW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_mciGetDeviceIDW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__mciGetDeviceIDW@4     ; place to save the pointer
                    push dword [_Unicows_mciGetDeviceIDW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_mciGetDeviceIDW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

mciGetDeviceIDW:
_mciGetDeviceIDW@4:
                    jmp [__imp__mciGetDeviceIDW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__mciGetDeviceIDW@4:   dd unicows_initial_stub_mciGetDeviceIDW
_Unicows_mciGetDeviceIDW:      dd 0
namestring_mciGetDeviceIDW:    db 'mciGetDeviceIDW',0
