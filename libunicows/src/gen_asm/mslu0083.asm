%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__waveInGetErrorTextW@12
                    global waveInGetErrorTextW
                    global _waveInGetErrorTextW@12
                    global _Unicows_waveInGetErrorTextW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_waveInGetErrorTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__waveInGetErrorTextW@12     ; place to save the pointer
                    push dword [_Unicows_waveInGetErrorTextW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_waveInGetErrorTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

waveInGetErrorTextW:
_waveInGetErrorTextW@12:
                    jmp [__imp__waveInGetErrorTextW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__waveInGetErrorTextW@12:   dd unicows_initial_stub_waveInGetErrorTextW
_Unicows_waveInGetErrorTextW:      dd 0
namestring_waveInGetErrorTextW:    db 'waveInGetErrorTextW',0
