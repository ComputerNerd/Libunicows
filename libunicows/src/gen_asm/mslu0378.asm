%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetSystemWindowsDirectoryW@8
                    global GetSystemWindowsDirectoryW
                    global _GetSystemWindowsDirectoryW@8
                    global _Unicows_GetSystemWindowsDirectoryW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetSystemWindowsDirectoryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetSystemWindowsDirectoryW@8     ; place to save the pointer
                    push dword [_Unicows_GetSystemWindowsDirectoryW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetSystemWindowsDirectoryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetSystemWindowsDirectoryW:
_GetSystemWindowsDirectoryW@8:
                    jmp [__imp__GetSystemWindowsDirectoryW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetSystemWindowsDirectoryW@8:   dd unicows_initial_stub_GetSystemWindowsDirectoryW
_Unicows_GetSystemWindowsDirectoryW:      dd 0
namestring_GetSystemWindowsDirectoryW:    db 'GetSystemWindowsDirectoryW',0
