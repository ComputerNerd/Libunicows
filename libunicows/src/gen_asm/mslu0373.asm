%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetWindowsDirectoryW@8
                    global GetWindowsDirectoryW
                    global _GetWindowsDirectoryW@8
                    global _Unicows_GetWindowsDirectoryW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetWindowsDirectoryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetWindowsDirectoryW@8     ; place to save the pointer
                    push dword [_Unicows_GetWindowsDirectoryW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetWindowsDirectoryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetWindowsDirectoryW:
_GetWindowsDirectoryW@8:
                    jmp [__imp__GetWindowsDirectoryW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetWindowsDirectoryW@8:   dd unicows_initial_stub_GetWindowsDirectoryW
_Unicows_GetWindowsDirectoryW:      dd 0
namestring_GetWindowsDirectoryW:    db 'GetWindowsDirectoryW',0
