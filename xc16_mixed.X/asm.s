;/* The MIT License (MIT)
; * Copyright (c) 2016 The Open-Source Community
; *
; * Permission is hereby granted, free of charge, to any person obtaining
; * a copy of this software and associated documentation files (the
; * "Software"), to deal in the Software without restriction, including
; * without limitation the rights to use, copy, modify, merge, publish,
; * distribute, sublicense, and/or sell copies of the Software, and to
; * permit persons to whom the Software is furnished to do so, subject
; * to the following conditions:
; *
; * The above copyright notice and this permission notice shall be included
; * in all copies or substantial portions of the Software.
; * 
; * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
; */

    .include "xc.inc"

    .text
    
    ; variables and functions that are to be used in the C
    ;	domain must be declared 'global'.  Additionally, an
    ;	underscore must be placed in front of it since the 
    ;	compiler places an underscore in front of code to be
    ;	assembled.
    .global _add
    
_add:
    add	    w0, w1, w2
    btsc    SR, #2	; check the overflow bit
    goto    _add_sat
    mov	    w2, w0
    
    return
    
    ; if the code gets here, then an overflow occured, need to saturate
    ; mask = 0x8000
_add_sat:
    ; if w0 is negative, then saturate negative, otherwise positive
    btsc    w0, #15
    goto    _add_neg_sat
    
_add_pos_sat:
    mov	    #32767, w0
    return
    
_add_neg_sat:
    mov	    #32768, w0
    return
    
    .end
    
    