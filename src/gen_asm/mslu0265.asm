%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__CryptVerifySignatureW@24
                    global CryptVerifySignatureW
                    global _CryptVerifySignatureW@24
                    global _Unicows_CryptVerifySignatureW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CryptVerifySignatureW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CryptVerifySignatureW@24     ; place to save the pointer
                    push dword [_Unicows_CryptVerifySignatureW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_CryptVerifySignatureW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CryptVerifySignatureW:
_CryptVerifySignatureW@24:
                    jmp [__imp__CryptVerifySignatureW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CryptVerifySignatureW@24:   dd unicows_initial_stub_CryptVerifySignatureW
_Unicows_CryptVerifySignatureW:      dd 0
namestring_CryptVerifySignatureW:    db 'CryptVerifySignatureW',0
