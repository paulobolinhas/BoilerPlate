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
    
    klee_make_symbolic(&key1, sizeof(key1), "key1");
    klee_make_symbolic(&key2, sizeof(key2), "key2");
   
    treetable_add(table, &key1, value1);
    treetable_add(table, &key2, value2);

    void* value;
    if (key1 != key2 && treetable_contains_key(table, &key1)){
        treetable_get(table, &key1, &value);
        assert((char*) value == value1);
    }

    if (treetable_contains_key(table, &key2)){
        treetable_get(table, &key2, &value);
        assert((char*) value == value2);
    }

    treetable_destroy(table);
}