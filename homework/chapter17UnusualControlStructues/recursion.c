/* Illustrates some approaches to managing recursion.
 *
 * Each call to the recursive factorial functions uses BLOCK_SIZE bytes.
 * 
 * Statically allocated version:
 *  Works for n = 15.
 *  Fails with stack overflow for n = 16.
 *  Tail recursive, so it can work for larger n when compiled with -O3
 *  Examine assembly code using gcc -O3 -S -masm=intel recursion.c
 *  
 * Dynamically allocated version:
 *  Works up to n = 33, where integer overflow (not stack overflow) occurs.
 *  Not tail recursive; cannot be optimized.
 *
 * (Preceding numbers assume 32 bit unsigned long integers.) 
 */

#include <stdio.h>
#include <stdlib.h>

#define BLOCK_SIZE 131072

int calls = 0;

unsigned long factorial_static(unsigned long n) 
{
  /* use stack storage */
  int a[BLOCK_SIZE / sizeof(int)];
  
  printf("Computing factorial of %lu\n", n);
  
  if (n == 1)
  {
    printf("Base case reached.\n");
    return 1;
  }
  else
  {
    printf("Making recursive call %d\n", ++calls);
    return n * factorial_static(n - 1);
  }
}

unsigned long factorial_dynamic(unsigned long n)
{
  unsigned long result;
  
  /* use heap storage */
  int* a = (int*)malloc(BLOCK_SIZE / sizeof(int)); 
  if (a == NULL)
  {
    printf("Dynamic memory allocation failed after %d calls.\n", calls);
    exit(1);
  }
  
  printf("Computing factorial of %lu\n", n);
  
  if (n == 1)
  {
    printf("Base case reached.\n");
    free(a);
    return 1;
  }
  else
  {
    printf("Making recursive call %d\n", ++calls);
    result = n * factorial_dynamic(n - 1);
    free(a);
    return result;
  }
}

void main()
{
  unsigned long n;
  int choice;
  
  printf("\nCompute factorial(n) for what value of n? ");
  scanf("%lu", &n);

  printf("1 for static allocation, or 2 for dynamic allocation? ");
  scanf("%d", &choice);
  
  if (choice == 1) printf("The factorial of %lu is %lu\n", n, factorial_static(n));
  else if (choice == 2) printf("The factorial of %lu is %lu\n", n, factorial_dynamic(n));
}
