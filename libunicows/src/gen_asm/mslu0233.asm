%include "dll_names.inc"

                    global __imp__VkKeyScanW@4
                    global VkKeyScanW
                    global _VkKeyScanW@4
                    global _Unicows_VkKeyScanW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_VkKeyScanW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__VkKeyScanW@4     ; place to save the pointer
                    push dword [_Unicows_VkKeyScanW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_VkKeyScanW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

VkKeyScanW:
_VkKeyScanW@4:
                    jmp [__imp__VkKeyScanW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__VkKeyScanW@4:   dd unicows_initial_stub_VkKeyScanW
_Unicows_VkKeyScanW:      dd 0
namestring_VkKeyScanW:    db 'VkKeyScanW',0
