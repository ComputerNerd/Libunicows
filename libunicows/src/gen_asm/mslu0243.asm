%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__SHChangeNotify@16
                    global SHChangeNotify
                    global _SHChangeNotify@16
                    global _Unicows_SHChangeNotify
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SHChangeNotify:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SHChangeNotify@16     ; place to save the pointer
                    push dword [_Unicows_SHChangeNotify]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_SHChangeNotify      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SHChangeNotify:
_SHChangeNotify@16:
                    jmp [__imp__SHChangeNotify@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SHChangeNotify@16:   dd unicows_initial_stub_SHChangeNotify
_Unicows_SHChangeNotify:      dd 0
namestring_SHChangeNotify:    db 'SHChangeNotify',0
