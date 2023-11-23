#include <stdio.h>

int main() {
    int num1 = 10;
    float num2 = 3.14;
    char ch = 'A';
    double result;

    result = num1 + num2;

    if (result > 10.0) {
        printf("Result is greater than 10\n");
    } else {
        printf("Result is not greater than 10\n");
    }

    return 0;
}
