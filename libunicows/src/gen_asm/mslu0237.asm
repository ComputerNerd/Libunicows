%include "dll_names.inc"

                    global __imp__DragQueryFileW@16
                    global DragQueryFileW
                    global _DragQueryFileW@16
                    global _Unicows_DragQueryFileW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_DragQueryFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DragQueryFileW@16     ; place to save the pointer
                    push dword [_Unicows_DragQueryFileW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_DragQueryFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

DragQueryFileW:
_DragQueryFileW@16:
                    jmp [__imp__DragQueryFileW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__DragQueryFileW@16:   dd unicows_initial_stub_DragQueryFileW
_Unicows_DragQueryFileW:      dd 0
namestring_DragQueryFileW:    db 'DragQueryFileW',0
