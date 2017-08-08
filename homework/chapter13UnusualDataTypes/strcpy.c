/* Demonstrates C's pointer arithmetic features.
 *
 * A pointer is a variable that holds an address instead of a data value.
 *
 * C allows pointer arithmetic: calculations using memory addresses.
 *
 * This is very powerful and flexible; dangerous if misused.
 *
 * In C, strings are NUL terminated character arrays.
 *
 * Here are alternate string copy routines.
 *
 */

#include <stdio.h>

/* Copy strings using array indexing. */
void strcpy0(char dest[], char src[])
{
	int i = 0;

	do
	{
		dest[i] = src[i];
	} while (src[i++] != '\0');
}

/* Copy strings using array indexing (terse). */
void strcpy1(char dest[], char src[])
{
	int i = 0;

	while (dest[i] = src[i++]) ;
}

/* Copy strings using pointer arithmetic. */
void strcpy2(char dest[], char src[])
{
	do
	{
		*dest = *src;
		dest++;
		src++;
	} while (*(src - 1) != '\0');
}

/* Copy strings using pointer arithmetic (terse). */
void strcpy3(char dest[], char src[])
{
	while (*dest++ = *src++) ;
}

void main()
{
	char str1[] = "hello";
	char str2[] = "world";

	printf("Before: %s, %s\n", str1, str2);
	strcpy1(str2, str1);
	printf("After:  %s, %s\n", str1, str2);
}

