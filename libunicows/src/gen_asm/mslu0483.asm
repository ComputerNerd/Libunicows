%include "dll_names.inc"

                    global __imp__capCreateCaptureWindowW
                    global _capCreateCaptureWindowW
                    global _Unicows_capCreateCaptureWindowW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_capCreateCaptureWindowW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__capCreateCaptureWindowW     ; place to save the pointer
                    push dword [_Unicows_capCreateCaptureWindowW]      ; default proc, if any
                    push dword AVICAP32                  ; dll id
                    push dword namestring_capCreateCaptureWindowW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__capCreateCaptureWindowW]

_capCreateCaptureWindowW:
                    jmp [__imp__capCreateCaptureWindowW]


                    section .data

__imp__capCreateCaptureWindowW:   dd unicows_initial_stub_capCreateCaptureWindowW
_Unicows_capCreateCaptureWindowW:      dd 0
namestring_capCreateCaptureWindowW:    db 'capCreateCaptureWindowW',0
