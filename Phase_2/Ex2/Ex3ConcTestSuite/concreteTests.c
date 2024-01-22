#include <stdio.h>
#include <assert.h>
#include "../treetable.h"  

void get_greater_node_template(int key1, int key2) {
    TreeTable *table;
    treetable_new(&table);

    int keyArray[] = {key1, key2};

    char value1[10];
    char value2[10];  
   
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

void add_nodes_template(int key1, int key2) {
    TreeTable *table;
    treetable_new(&table);

    char value1[] = "aaa";
    char value2[] = "bbb";  
   
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

/*
Goal: Create a node and put it in the tree to obtain it later.
      Create a node, do not put it in the tree, and try to get it to obtain CC_ERR_KEY_NOT_FOUND.
*/
void get_keys_template(int key1, int key2) {
    TreeTable *table;
    treetable_new(&table);

    char value1[] = "aaa";
    char value2[] = "bbb";  
    
    int ccStat;
    void* valueObtained;
   
    ccStat = treetable_get(table, &key2, &valueObtained);
    assert(ccStat == CC_ERR_KEY_NOT_FOUND);

    treetable_add(table, &key1, value1);

    ccStat = treetable_get(table, &key1, &valueObtained);
    assert(ccStat == CC_OK);

    treetable_destroy(table);
}

void get_first_key(int key1, int key2) {
  
    TreeTable *table;
    treetable_new(&table);

    int keyArray[] = {key1, key2};

    char value1[10];
    char value2[10];  
    
    int ccStat;
    void* outputKey;
   
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

int main() {
    add_nodes_template(0, 0);
    add_nodes_template(1, 0);
    add_nodes_template(-1979711488, 0);

    get_keys_template(0, 0);

    get_greater_node_template(0, 0);
    get_greater_node_template(-1414812757, -2147483648);
    get_greater_node_template(-2147483647, -2147483648);

    get_greater_node_template(-2147483648, -2147483648);
    get_greater_node_template(-1414812757, -1414812757);
    get_greater_node_template(1, 0);

    get_greater_node_template(-1056964608, 0);
    get_greater_node_template(-1414812757, 0);
    get_greater_node_template(0, -2147483648);

    get_greater_node_template(0, -1414812757);
    get_greater_node_template(-1979711488, 0);
    get_greater_node_template(-2147483647, -2130706432);

    get_greater_node_template(-2147483648, -1414812757);

    get_first_key(0, 0);
    get_first_key(1, 0);
    get_first_key(-1979711488, 0);


}