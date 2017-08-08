/* Uses a union to interpret binary RAM contents as different datatypes.
 *
 * This mimics the effect of Fig. 13-1 on p. 324 of Code Complete, 2e.
 *
 * Note: C uses NUL terminated strings rather than VB's length-prefixed strings.
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void main()
{
	union ram_union
	{
		char string[12];
		short int short_int;
		float float_pt;
		long int long_int;
		char one_char;
	};

	/* Set RAM contents as in Fig. 13-1. */
	union ram_union ram;
	strcpy(ram.string, "\nabcdefghij");
	
	printf("As C string:\t %s \n", ram.string);
	
	printf("As short int:\t %d \n", ram.short_int);

	printf("As float:\t %e \n", ram.float_pt);

	printf("As long int:\t %ld \n", ram.long_int);

	printf("As char (LF):\t %c \n", ram.one_char);
}

