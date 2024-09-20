#include<stdio.h>

int a = 0;
int b = 0;
float c = 0.0;
double d = 0.0;

// 比较两个整数的max函数
int max(int a, int b) {
    if(a >= b) {
        return a;
    } else {
        return b;
    }
}

// 修改max函数，接受double类型参数
double max_(double a, double b) {
    if(a >= b) {
        return a;
    } else {
        return b;
    }
}

int main() {
    // 输入整数、浮点数和双精度数
    scanf("%d %d %f %lf", &a, &b, &c, &d);

    // 输出int类型最大值
    printf("max (int) is: %d\n", max(a, b));

    // 输出float和double的最大值，使用%.2f来显示浮点数
    printf("max (float/double) is: %.2f\n", max_((double)c, d));
    //printf("%.2f\n",c);
    return 0;
}
