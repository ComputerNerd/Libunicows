%include "dll_names.inc"

                    global __imp__SetVolumeLabelW@8
                    global SetVolumeLabelW
                    global _SetVolumeLabelW@8
                    global _Unicows_SetVolumeLabelW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SetVolumeLabelW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetVolumeLabelW@8     ; place to save the pointer
                    push dword [_Unicows_SetVolumeLabelW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_SetVolumeLabelW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SetVolumeLabelW:
_SetVolumeLabelW@8:
                    jmp [__imp__SetVolumeLabelW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SetVolumeLabelW@8:   dd unicows_initial_stub_SetVolumeLabelW
_Unicows_SetVolumeLabelW:      dd 0
namestring_SetVolumeLabelW:    db 'SetVolumeLabelW',0
