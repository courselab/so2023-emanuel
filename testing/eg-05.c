/* Boot, say hello and halt. 
   Using macro-like functions, with linkder script.
*/

// gcc -m16 -O0 -Wall -fno-pic -fno-asynchronous-unwind-tables -fcf-protection=none -nostdlib  -I. -T mbr.ld eg-05.c eg-05_utils.c -o teste

#include <eg-05.h>

const char msg[]  = "Hello World";


void __attribute__((naked)) _start()   /* This will be a label in asm code. */
{

  init_stack();		    /* Needed for function calls (see eg-05.h) */
  
  write_str(msg);	    /* This will be a functional call in asm code. */

  halt();                   /* This will be a function call in asm code. */
}


/* Notes

   This code looks like eg-04.c, but with function-like macros replaced 
   with actual function calls.

 */
