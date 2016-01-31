/*
 * File:   main.c
 * Author: Jason
 *
 * Created on January 31, 2016, 6:01 PM
 */


#include "xc.h"
#include "main.h"

int main(void) {
    signed int num0 = 100, num1 = 200;
    
    signed int result = add(num0, num1);
    
    while(1);   // infinite loop
    
    return 0;
}
