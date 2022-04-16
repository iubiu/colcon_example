#include "stdlib.h"
#include "stdio.h"
#include "string.h"
#include "add_two.h"

int add_three(int a, int b, int c)
{
    int result = add(add(a, b), c);
    printf("add three lib out %d\n", result);
    return result;
}

