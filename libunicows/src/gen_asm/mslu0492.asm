%include "dll_names.inc"

                    global __imp__QuerySecurityPackageInfoW@8
                    global QuerySecurityPackageInfoW
                    global _QuerySecurityPackageInfoW@8
                    global _Unicows_QuerySecurityPackageInfoW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_QuerySecurityPackageInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__QuerySecurityPackageInfoW@8     ; place to save the pointer
                    push dword [_Unicows_QuerySecurityPackageInfoW]      ; default proc, if any
                    push dword SECUR32                  ; dll id
                    push dword namestring_QuerySecurityPackageInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

QuerySecurityPackageInfoW:
_QuerySecurityPackageInfoW@8:
                    jmp [__imp__QuerySecurityPackageInfoW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__QuerySecurityPackageInfoW@8:   dd unicows_initial_stub_QuerySecurityPackageInfoW
_Unicows_QuerySecurityPackageInfoW:      dd 0
namestring_QuerySecurityPackageInfoW:    db 'QuerySecurityPackageInfoW',0
