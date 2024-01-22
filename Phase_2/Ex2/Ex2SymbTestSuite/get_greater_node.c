#include "klee/klee.h"
#include <assert.h>
#include <stdio.h>
#include "../treetable.h"

int main() { 
  
    TreeTable *table;
    treetable_new(&table);

    int key1;
    int key2;

    int keyArray[] = {key1, key2};

    char value1[10];
    char value2[10];  
    
    klee_make_symbolic(&key1, sizeof(key1), "key1");
    klee_make_symbolic(&key2, sizeof(key2), "key2");
   
    treetable_add(table, &key1, value1);
    treetable_add(table, &key2, value2);

    void* outputKey;
    
    int i = 0;
    while (i < 2) {
        int currentKey = keyArray[i];
        int ccStat = treetable_get_greater_than(table, &currentKey, &outputKey);
        if (ccStat == CC_OK) {
            assert(*(int*)outputKey > currentKey);
        } else {
            assert(ccStat == CC_ERR_KEY_NOT_FOUND);
        }
        i++;
    }

    treetable_destroy(table);
}