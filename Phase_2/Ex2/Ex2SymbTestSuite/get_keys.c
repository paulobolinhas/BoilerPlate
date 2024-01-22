#include "klee/klee.h"
#include <assert.h>
#include <stdio.h>
#include "../treetable.h"

int main() { 
  
    TreeTable *table;
    treetable_new(&table);

    int key1;
    int key2;

    char value1[] = "aaa";
    char value2[] = "bbb";  
    
    int ccStat;
    void* valueObtained;
    
    klee_make_symbolic(&key1, sizeof(key1), "key1");
    klee_make_symbolic(&key2, sizeof(key2), "key2");
   
    ccStat = treetable_get(table, &key2, &valueObtained);
    assert(ccStat == CC_ERR_KEY_NOT_FOUND);

    treetable_add(table, &key1, value1);

    ccStat = treetable_get(table, &key1, &valueObtained);
    assert(ccStat == CC_OK);

    treetable_destroy(table);
}