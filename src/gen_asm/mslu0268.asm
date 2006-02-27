%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__IsTextUnicode@12
                    global IsTextUnicode
                    global _IsTextUnicode@12
                    global _Unicows_IsTextUnicode
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_IsTextUnicode:
                    ; Load the symbol...
                    pusha
                    push dword __imp__IsTextUnicode@12     ; place to save the pointer
                    push dword [_Unicows_IsTextUnicode]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_IsTextUnicode      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

IsTextUnicode:
_IsTextUnicode@12:
                    jmp [__imp__IsTextUnicode@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__IsTextUnicode@12:   dd unicows_initial_stub_IsTextUnicode
_Unicows_IsTextUnicode:      dd 0
namestring_IsTextUnicode:    db 'IsTextUnicode',0
