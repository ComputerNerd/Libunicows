%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__mciGetErrorStringW@12
                    global mciGetErrorStringW
                    global _mciGetErrorStringW@12
                    global _Unicows_mciGetErrorStringW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_mciGetErrorStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__mciGetErrorStringW@12     ; place to save the pointer
                    push dword [_Unicows_mciGetErrorStringW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_mciGetErrorStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

mciGetErrorStringW:
_mciGetErrorStringW@12:
                    jmp [__imp__mciGetErrorStringW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__mciGetErrorStringW@12:   dd unicows_initial_stub_mciGetErrorStringW
_Unicows_mciGetErrorStringW:      dd 0
namestring_mciGetErrorStringW:    db 'mciGetErrorStringW',0
