; $Id$
;
; Implementation of global mutex locking for libunicows. Unlike win32 API
; functions, this doesn't require any initialization at startup (except for
; initializing a variable to 1 in data segment). It uses i386's XCHG
; instruction for atomic memory write & read and busy waiting on mutex
; (it's not most efficient, but it's only used to lock LoadUnicowsSymbols
; which is called only once per symbol).
;
; More details on the impementation can be found here:
; http://lists.canonical.org/pipermail/kragen-tol/1999-August/000457.html
; (excerpt:
;    The simplest is the XCHG instruction, which can be used to atomically
;    exchange two registers or a register and a memory location.  This makes
;    it possible to implement multiple exclusion; reserve a particular
;    location in RAM as a mutex, and initially set it to 1.  To acquire the
;    mutex, set a register to 0, and XCHG it with the location in RAM.  If
;    what you get back is a 1, then you have successfully acquired the
;    mutex; otherwise, someone else has it.  You can return the mutex simply
;    by setting the location to a nonzero value.)


%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __LockUnicowsMutex
                    global __UnlockUnicowsMutex

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

__LockUnicowsMutex:
                    xor eax, eax
                    xchg eax, dword [__UnicowsGlobalMutex]
                    and eax, eax
                    jz __LockUnicowsMutex  ; if we got zero, busy-wait
                    ret

__UnlockUnicowsMutex:
                    mov dword [__UnicowsGlobalMutex], 1
                    ret

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__UnicowsGlobalMutex dd 1
