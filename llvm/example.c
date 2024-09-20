#include <stdio.h>

// 函数声明
void printArray(float *arr, int size);
float average(float *arr, int size);

int main() {
    int size;

    // 输入数组大小
    printf("请输入数组的大小: ");
    scanf("%d", &size);

    // 定义数组并输入元素
    float numbers[size];
    printf("请输入 %d 个浮点数:\n", size);
    for (int i = 0; i < size; i++) {
        scanf("%f", &numbers[i]);
    }

    // 输出数组
    printf("数组中的元素是: ");
    printArray(numbers, size);

    // 计算并输出数组的平均值
    float avg = average(numbers, size);
    printf("\n数组的平均值是: %.2f\n", avg);

    return 0;
}

// 使用指针打印数组元素
void printArray(float *arr, int size) {
    for (int i = 0; i < size; i++) {
        printf("%.2f ", *(arr + i));
    }
}

// 计算数组的平均值
float average(float *arr, int size) {
    float sum = 0.0;
    for (int i = 0; i < size; i++) {
        sum += *(arr + i);
    }
    return sum / size;
}
