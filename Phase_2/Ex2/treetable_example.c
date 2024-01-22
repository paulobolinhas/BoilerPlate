#include <stdio.h>
#include "treetable.h"

int main() {
    TreeTable *table;
    treetable_new(&table);

    int key1 = 1;
    int key2 = -1;
    int key3 = 10;
    int key4 = 8;
    int key5 = 7;
    int key6 = 9;

    char value1[] = "....."; 

    treetable_add(table, &key1, value1);
    treetable_add(table, &key2, value1);
    treetable_add(table, &key3, value1);
    treetable_add(table, &key4, value1);
    treetable_add(table, &key5, value1);
    treetable_add(table, &key6, value1);


    void* outputKey;

    int isBalanced = sorted(table);
    printf("is sorted? %d\n", isBalanced);

    treetable_destroy(table);
}
