%include "dll_names.inc"

                    global __imp__WideCharToMultiByte@32
                    global WideCharToMultiByte
                    global _WideCharToMultiByte@32
                    global _Unicows_WideCharToMultiByte
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WideCharToMultiByte:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WideCharToMultiByte@32     ; place to save the pointer
                    push dword [_Unicows_WideCharToMultiByte]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_WideCharToMultiByte      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WideCharToMultiByte:
_WideCharToMultiByte@32:
                    jmp [__imp__WideCharToMultiByte@32]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WideCharToMultiByte@32:   dd unicows_initial_stub_WideCharToMultiByte
_Unicows_WideCharToMultiByte:      dd 0
namestring_WideCharToMultiByte:    db 'WideCharToMultiByte',0
