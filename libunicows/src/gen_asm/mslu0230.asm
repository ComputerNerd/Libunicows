%include "dll_names.inc"

                    global __imp__VkKeyScanW@4
                    global _VkKeyScanW@4
                    global _Unicows_VkKeyScanW
                  
                    extern _LoadUnicowsSymbol

                    section .text

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

                    ; ...and skip to it
                    jmp [__imp__VkKeyScanW@4]

_VkKeyScanW@4:
                    jmp [__imp__VkKeyScanW@4]


                    section .data

__imp__VkKeyScanW@4:   dd unicows_initial_stub_VkKeyScanW
_Unicows_VkKeyScanW:      dd 0
namestring_VkKeyScanW:    db 'VkKeyScanW',0
