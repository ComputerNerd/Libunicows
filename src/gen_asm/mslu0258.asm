%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__CryptAcquireContextW@20
                    global CryptAcquireContextW
                    global _CryptAcquireContextW@20
                    global _Unicows_CryptAcquireContextW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CryptAcquireContextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CryptAcquireContextW@20     ; place to save the pointer
                    push dword [_Unicows_CryptAcquireContextW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_CryptAcquireContextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CryptAcquireContextW:
_CryptAcquireContextW@20:
                    jmp [__imp__CryptAcquireContextW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CryptAcquireContextW@20:   dd unicows_initial_stub_CryptAcquireContextW
_Unicows_CryptAcquireContextW:      dd 0
namestring_CryptAcquireContextW:    db 'CryptAcquireContextW',0
