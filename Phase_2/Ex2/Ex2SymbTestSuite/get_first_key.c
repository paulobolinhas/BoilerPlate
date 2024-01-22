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
    
    int ccStat;
    void* outputKey;

    klee_make_symbolic(&key1, sizeof(key1), "key1");
    klee_make_symbolic(&key2, sizeof(key2), "key2");
   
    ccStat = treetable_get_first_key(table, &outputKey);
    assert(ccStat == CC_ERR_KEY_NOT_FOUND);

    treetable_add(table, &key1, value1);
    ccStat = treetable_get_first_key(table, &outputKey);
    assert(ccStat == CC_OK);
    assert(*(int*)outputKey == key1);
    

    treetable_add(table, &key2, value2);
    ccStat = treetable_get_first_key(table, &outputKey);
    assert(ccStat == CC_OK);
    if (key2 <= key1) {
        assert(*(int*)outputKey == key2);
    } else {
        assert(*(int*)outputKey == key1);
    }
    
    treetable_destroy(table);
}