%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__LoadCursorFromFileW@4
                    global LoadCursorFromFileW
                    global _LoadCursorFromFileW@4
                    global _Unicows_LoadCursorFromFileW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_LoadCursorFromFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__LoadCursorFromFileW@4     ; place to save the pointer
                    push dword [_Unicows_LoadCursorFromFileW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_LoadCursorFromFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

LoadCursorFromFileW:
_LoadCursorFromFileW@4:
                    jmp [__imp__LoadCursorFromFileW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__LoadCursorFromFileW@4:   dd unicows_initial_stub_LoadCursorFromFileW
_Unicows_LoadCursorFromFileW:      dd 0
namestring_LoadCursorFromFileW:    db 'LoadCursorFromFileW',0
