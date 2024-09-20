
#include <stdio.h>
#include <stdlib.h>

// 定义链表节点结构体
struct Node {
    int data;
    struct Node* next;
};

// 创建新节点
struct Node* createNode(int data) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = data;
    newNode->next = NULL;
    return newNode;
}

// 头插法插入新节点
void insertAtHead(struct Node** head, int data) {
    struct Node* newNode = createNode(data);
    newNode->next = *head;
    *head = newNode;
}

// 打印链表中的所有节点
void printList(struct Node* head) {
    struct Node* temp = head;
    while (temp != NULL) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

// 释放链表内存
void freeList(struct Node* head) {
    struct Node* temp;
    while (head != NULL) {
        temp = head;
        head = head->next;
        free(temp);
    }
}

int main() {
    struct Node* head = NULL;  // 初始化链表为空
    char input[100];  // 存储用户输入的字符串
    int number;

    printf("请输入数字，每行一个，输入空行结束输入：\n");

    // 读取用户输入，直到空行终止
    while (fgets(input, sizeof(input), stdin) && input[0] != '\n') {
        // 将输入的字符串转换为整数并插入到链表头部
        if (sscanf(input, "%d", &number) == 1) {
            insertAtHead(&head, number);
        } else {
            printf("输入无效，请输入一个有效的整数。\n");
        }
    }

    // 打印链表中的数字
    printf("链表中的数字为：\n");
    printList(head);

    // 释放链表内存
    freeList(head);

    return 0;
}
