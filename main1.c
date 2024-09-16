#include <stdio.h>

int main() {
    int i, n, f;
    printf("请输入一个整数 n: ");
    scanf("%d", &n);  // 输入一个整数 n
    i = 2;
    f = 1;

    while (i <= n) {
        f = f * i;  // 计算阶乘
        i = i + 1;
    }

    printf("阶乘结果: %d\n", f);  // 输出阶乘的结果
    
    return 0;
}
