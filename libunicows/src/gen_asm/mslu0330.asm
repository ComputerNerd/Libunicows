%include "dll_names.inc"

                    global __imp__GetCPInfo@8
                    global GetCPInfo
                    global _GetCPInfo@8
                    global _Unicows_GetCPInfo
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetCPInfo:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetCPInfo@8     ; place to save the pointer
                    push dword [_Unicows_GetCPInfo]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetCPInfo      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetCPInfo:
_GetCPInfo@8:
                    jmp [__imp__GetCPInfo@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetCPInfo@8:   dd unicows_initial_stub_GetCPInfo
_Unicows_GetCPInfo:      dd 0
namestring_GetCPInfo:    db 'GetCPInfo',0
