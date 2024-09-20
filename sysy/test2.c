#include <stdio.h>

// 冒泡排序算法
void bubbleSort(int arr[], int n) {
    for (int i = 0; i < n-1; i++) {
        // 外层循环控制排序的轮数
        for (int j = 0; j < n-i-1; j++) {
            // 内层循环比较相邻的元素
            if (arr[j] > arr[j+1]) {
                // 交换元素
                int temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
}

// 打印数组
void printArray(int arr[], int size) {
    for (int i = 0; i < size; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

int main() {
    int arr[] = {64, 34, 25, 12, 22, 11, 90};
    int n = sizeof(arr)/sizeof(arr[0]);

    printf("原数组: \n");
    printArray(arr, n);

    bubbleSort(arr, n);

    printf("排序后的数组: \n");
    printArray(arr, n);

    return 0;
    
}


