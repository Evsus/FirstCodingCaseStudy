/* Demonstrates interpretations of binary RAM contents via different datatypes.
 *
 * This mimics Fig. 13-1 on p. 324 of Code Complete, 2e.
 *
 * Note: C uses NUL terminated strings rather than VB's length-prefixed strings.
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void main()
{
	/* Set RAM contents as in Fig. 13-1. */
	char ram[12];
	strcpy(ram, "\nabcdefghij");
	
	printf("As C string:\t %s \n", ram);
	
	/* Use pointers to various types to reinterpret the bits. */
	short int *short_ptr = (short int *)ram;
	printf("As short int:\t %d \n", *short_ptr);

	float *float_ptr = (float *)ram;
	printf("As float:\t %e \n", *float_ptr);

	long int *long_ptr = (long int *)ram;
	printf("As long int:\t %ld \n", *long_ptr);

	printf("As char (LF):\t %c \n", ram);
}

