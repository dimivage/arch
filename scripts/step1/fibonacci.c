#include <stdio.h>

int main() {
    int n = 5;
    int a = 0, b = 1, next;

    printf("Fibonacci sequence up to term %d:\n", n);
    for (int i = 1; i <= n; i++) {
        printf("%d ", a);
        next = a + b;
        a = b;
        b = next;
    }
    printf("\n");
    return 0;
}

