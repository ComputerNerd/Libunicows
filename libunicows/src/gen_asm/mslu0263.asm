%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__CryptSetProviderW@8
                    global CryptSetProviderW
                    global _CryptSetProviderW@8
                    global _Unicows_CryptSetProviderW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CryptSetProviderW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CryptSetProviderW@8     ; place to save the pointer
                    push dword [_Unicows_CryptSetProviderW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_CryptSetProviderW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CryptSetProviderW:
_CryptSetProviderW@8:
                    jmp [__imp__CryptSetProviderW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CryptSetProviderW@8:   dd unicows_initial_stub_CryptSetProviderW
_Unicows_CryptSetProviderW:      dd 0
namestring_CryptSetProviderW:    db 'CryptSetProviderW',0
