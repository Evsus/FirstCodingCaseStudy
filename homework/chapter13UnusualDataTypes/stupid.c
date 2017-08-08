/* Demonstrates various errors with C pointers and memory manipulation.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void buffer_overflow()
{

	char str2[] = "world";
	char str1[] = "hello";
	
	printf("Before: %s, %s\n", str1, str2);
	strcpy(str1, "This long text will overflow the buffer.");
	printf("After:  %s, %s\n", str1, str2);
}

void memory_leak()
{
	void *p;

	do
	{
		printf("Allocating a large memory buffer.\n");
		p = (void *)malloc(1024 * 1024 * 1024);
	} while (p != NULL);

	printf("\nOut of memory.\n");
}

void dangling_pointer()
{
	int i, *p_int = (int *)malloc(sizeof(int));

	*p_int = 1234;

	for (i = 0; i < 1234; i++)
	{
		free(p_int);
		*p_int = i;
	}
}

void bad_memory_write()
{
	char *p = NULL;
	*p = 0xFFFFFFFFFFFF;
}

void bad_memory_read()
{
	char *p = (void *)1234;
	printf("The contents of RAM starting at address %d:\n %X\n", p, *p);
}

void main()
{
	int choice;
	printf("This program illustrates the power and danger of C.\n");
	printf("Pick a number to try a stupid C example.\n\n");
	printf("\t1 buffer_overflow\n");
	printf("\t2 memory_leak\n");
	printf("\t3 dangling_pointer\n");
	printf("\t3 bad_memory_write\n");
	printf("\t4 bad_memory_read\n");
	printf("\nEnter 1-5: ");
	scanf("%d", &choice);
	
	switch (choice) {
		case 1: buffer_overflow(); break;
		case 2: memory_leak(); break;
		case 3: dangling_pointer(); break;
		case 4: bad_memory_write(); break;
		case 5: bad_memory_read(); break;
	}
}

