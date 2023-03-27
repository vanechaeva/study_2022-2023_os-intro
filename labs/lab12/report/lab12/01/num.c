#include <stdio.h>
#include <stdlib.h>

int main() {
    int num;
    printf("Введите число: ");
    scanf("%d", &num);

    if (num > 0) {
        printf("n > 0\n");
        exit(num);
    } else if (num < 0) {
        printf("n < 0\n");
        exit(num);
    } else {
        printf("n = 0\n");
        exit(num);
    }
    return 0;
}
