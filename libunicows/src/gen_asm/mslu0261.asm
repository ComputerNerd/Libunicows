%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__CryptGetDefaultProviderW@20
                    global CryptGetDefaultProviderW
                    global _CryptGetDefaultProviderW@20
                    global _Unicows_CryptGetDefaultProviderW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CryptGetDefaultProviderW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CryptGetDefaultProviderW@20     ; place to save the pointer
                    push dword [_Unicows_CryptGetDefaultProviderW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_CryptGetDefaultProviderW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CryptGetDefaultProviderW:
_CryptGetDefaultProviderW@20:
                    jmp [__imp__CryptGetDefaultProviderW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CryptGetDefaultProviderW@20:   dd unicows_initial_stub_CryptGetDefaultProviderW
_Unicows_CryptGetDefaultProviderW:      dd 0
namestring_CryptGetDefaultProviderW:    db 'CryptGetDefaultProviderW',0
