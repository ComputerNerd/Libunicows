%include "dll_names.inc"

                    global __imp__LoadLibraryW@4
                    global LoadLibraryW
                    global _LoadLibraryW@4
                    global _Unicows_LoadLibraryW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_LoadLibraryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__LoadLibraryW@4     ; place to save the pointer
                    push dword [_Unicows_LoadLibraryW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_LoadLibraryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

LoadLibraryW:
_LoadLibraryW@4:
                    jmp [__imp__LoadLibraryW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__LoadLibraryW@4:   dd unicows_initial_stub_LoadLibraryW
_Unicows_LoadLibraryW:      dd 0
namestring_LoadLibraryW:    db 'LoadLibraryW',0
