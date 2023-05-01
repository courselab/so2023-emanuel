#   <file> - <One-line note about this file>
# 
#   Copyright (c) <YEAR>, <AUTHOR> 
#
#   This piece of software is a derivative work of SYSeg, by Monaco F. J.
#   SYSeg is distributed under the license GNU GPL v3, and is available
#   at the official repository https://www.gitlab.com/monaco/syseg.
#
#   This file is part of <PROJECT>.
#
#   <PROJECT> is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#   
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#   
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Boot, say hello, and halt (AT&T assembly)

    .code16
    .global _start
	
_start:	
        movb  $0xe, %ah	       # use BIOS tty mode
	movw  $0x0, %bx	       # index counter

loop_booting:			      
	movb  msg_booting(%bx), %al    # Offset to each character in the message
	cmp   $0x0, %al	               # Loop while char is not 0x0 (end of string)
	je    break_line               # Jump to msg_hello if last cmp was true
	int   $0x10	               # Call BIOS video service
	inc   %bx	               # Point to the next character
	jmp   loop_booting             # Repeat until we find a character 0x0

break_line:
        movw  $0x0, %bx	    
        movb msg_line_feed(%bx), %al 
        int $0x10
        movb msg_line_break(%bx), %al 
        int $0x10
msg_hello_init:
        movw  $0x0, %bx	               # index counter
loop_hello:			      
	movb  msg_hello(%bx), %al    # Offset to each character in the message
	cmp   $0x0, %al	               # Loop while char is not 0x0 (end of string)
	je    halt                     # Jump to halt if last cmp was true
	int   $0x10	               # Call BIOS video service
	inc   %bx	               # Point to the next character
	jmp   loop_hello               # Repeat until we find a character 0x0
  
halt:
        hlt
        jmp halt

msg_booting:
        .string "Booting..."
msg_line_feed:
        .word 0x0a
msg_line_break:
        .word 0x0d                    
msg_hello:
        .string "Hello World!"
        .fill 510 - (. - _start), 1, 0   # Pad with zeros
	.word 0xaa55			 # Boot signature
