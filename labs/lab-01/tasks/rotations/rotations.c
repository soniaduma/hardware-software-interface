#include<stdio.h>

int rotate_left(unsigned int x, int n) {
    unsigned int mask = x >> (32 - n);
    x = x << n;
    x |= mask;
    return x;
}

int rotate_right(int x, int n) {
    unsigned int mask = x << n;
    x >> n;
    x |= mask;
    return x;
}

int main(){
    unsigned int x = 0x80000000;
    int n = 1;
    x = rotate_left(x, n);
    printf("%d", x);
    return 0;
}

