#include <stdio.h>

int main() {
    int a, b, i, t, n;

    // 初始化
    a = 0;
    b = 1;
    i = 1;

    // 输入要生成的斐波那契数列的项数
    scanf("%d", &n);

    // 输出前两个斐波那契数
    printf("%d\n", a);
    printf("%d\n", b);

    // 循环输出剩余的斐波那契数
    while (i < n) {
        t = b;
        b = a + b;
        printf("%d\n", b);
        a = t;
        i = i + 1;
    }

    return 0;
    
}