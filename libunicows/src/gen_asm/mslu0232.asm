%include "dll_names.inc"

                    global __imp__VkKeyScanExW@8
                    global _VkKeyScanExW@8
                    global _Unicows_VkKeyScanExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_VkKeyScanExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__VkKeyScanExW@8     ; place to save the pointer
                    push dword [_Unicows_VkKeyScanExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_VkKeyScanExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__VkKeyScanExW@8]

_VkKeyScanExW@8:
                    jmp [__imp__VkKeyScanExW@8]


                    section .data

__imp__VkKeyScanExW@8:   dd unicows_initial_stub_VkKeyScanExW
_Unicows_VkKeyScanExW:      dd 0
namestring_VkKeyScanExW:    db 'VkKeyScanExW',0
