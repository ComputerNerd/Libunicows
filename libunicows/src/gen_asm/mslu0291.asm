%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__FindTextW@4
                    global FindTextW
                    global _FindTextW@4
                    global _Unicows_FindTextW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_FindTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FindTextW@4     ; place to save the pointer
                    push dword [_Unicows_FindTextW]      ; default proc, if any
                    push dword COMDLG32                  ; dll id
                    push dword namestring_FindTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

FindTextW:
_FindTextW@4:
                    jmp [__imp__FindTextW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__FindTextW@4:   dd unicows_initial_stub_FindTextW
_Unicows_FindTextW:      dd 0
namestring_FindTextW:    db 'FindTextW',0
