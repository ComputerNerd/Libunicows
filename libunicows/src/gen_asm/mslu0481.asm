%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__MCIWndCreateW
                    global MCIWndCreateW
                    global _MCIWndCreateW
                    global _Unicows_MCIWndCreateW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_MCIWndCreateW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__MCIWndCreateW     ; place to save the pointer
                    push dword [_Unicows_MCIWndCreateW]      ; default proc, if any
                    push dword MSVFW32                  ; dll id
                    push dword namestring_MCIWndCreateW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

MCIWndCreateW:
_MCIWndCreateW:
                    jmp [__imp__MCIWndCreateW]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__MCIWndCreateW:   dd unicows_initial_stub_MCIWndCreateW
_Unicows_MCIWndCreateW:      dd 0
namestring_MCIWndCreateW:    db 'MCIWndCreateW',0
