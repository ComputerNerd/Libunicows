%include "dll_names.inc"

                    global __imp__QueryDosDeviceW@12
                    global QueryDosDeviceW
                    global _QueryDosDeviceW@12
                    global _Unicows_QueryDosDeviceW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_QueryDosDeviceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__QueryDosDeviceW@12     ; place to save the pointer
                    push dword [_Unicows_QueryDosDeviceW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_QueryDosDeviceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

QueryDosDeviceW:
_QueryDosDeviceW@12:
                    jmp [__imp__QueryDosDeviceW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__QueryDosDeviceW@12:   dd unicows_initial_stub_QueryDosDeviceW
_Unicows_QueryDosDeviceW:      dd 0
namestring_QueryDosDeviceW:    db 'QueryDosDeviceW',0
