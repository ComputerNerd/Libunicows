%include "dll_names.inc"

                    global __imp__waveOutGetErrorTextW@12
                    global waveOutGetErrorTextW
                    global _waveOutGetErrorTextW@12
                    global _Unicows_waveOutGetErrorTextW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_waveOutGetErrorTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__waveOutGetErrorTextW@12     ; place to save the pointer
                    push dword [_Unicows_waveOutGetErrorTextW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_waveOutGetErrorTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

waveOutGetErrorTextW:
_waveOutGetErrorTextW@12:
                    jmp [__imp__waveOutGetErrorTextW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__waveOutGetErrorTextW@12:   dd unicows_initial_stub_waveOutGetErrorTextW
_Unicows_waveOutGetErrorTextW:      dd 0
namestring_waveOutGetErrorTextW:    db 'waveOutGetErrorTextW',0
