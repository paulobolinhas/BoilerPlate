/* Copyright (C) 2014  Richard Wiedenhöft <richard.wiedenhoeft@gmail.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#include "hashmap.h"
#include <assert.h>
#include <string.h>

unsigned long int hashmap_fnv1a(void *data, unsigned long int len) {
  unsigned char *p = (unsigned char *)data;
  unsigned long int h = 2166136261UL;
  unsigned long int i;

  for (i = 0; i < len; i++) {
    h = (h ^ p[i]) * 16777619;
  }

  return h;
}

int hashmap_hash(char *str, int max_hash) {
  unsigned long int fnv1a_hash = hashmap_fnv1a((void *)str, strlen(str));
  int hash = (int)(fnv1a_hash % (max_hash + 1));
  return hash;
}

struct hashmap_s {
  int size;
  struct hashmap_field *fields;
};

struct hashmap_field {
  int size;
  struct hashmap_entry *entries;
};

struct hashmap_entry {
  char *key;
  void *val;
  size_t len;
};

hashmap_t hashmap_new(int size) {
  hashmap_t map = (hashmap_t)malloc(sizeof(struct hashmap_s));

  /* Fixes 1*/
	if (!map) {
	  exit(1);
	}

  struct hashmap_field *fields =
      (struct hashmap_field *)malloc(sizeof(struct hashmap_field) * size);

  /* Fixes 5*/ /* Fixes 6*/
	if (!fields) {
	  exit(1);
	}

  if (!fields) {
    free(map);
  }

  for (int i = 0; i < size; i++) {
    struct hashmap_field *field = &fields[i];
    /* BUG-6 */
    field->size = 0;
    field->entries = NULL;
  }

  /* BUG-1 */
  map->size = size;
  map->fields = fields;

  return map;
}

void hashmap_free(hashmap_t map) {
  for (int i = 0; i < map->size; i++) {
    struct hashmap_field *field = map->fields + i;
    if (field->entries != 0) {
      int j;
      for (j = 0; j < field->size; j++) {
        struct hashmap_entry *entry = field->entries + j;
        free(entry->key);
        free(entry->val);
      }
      free(field->entries);
    }
  }
  free(map->fields);
  free(map);
}

void hashmap_set(hashmap_t map, char *key, void *value, size_t length) {
  int hash = hashmap_hash(key, map->size - 1);
  struct hashmap_field *field = map->fields + hash;
  struct hashmap_entry *entry;

  int i;
  for (i = 0; i < field->size; i++) {
    entry = field->entries + i;
    if (strcmp(entry->key, key) == 0) {
      free(entry->val);
      goto set_val;
    }
  }

  if (value == NULL) {
    return;
  }

  field->size++;
  /* BUG-9 */
  struct hashmap_entry *entries = (struct hashmap_entry *)malloc(
      field->size * sizeof(struct hashmap_entry));
  /* Manual Fixes 9*/
  if(!entries) {
    exit(1);
  }
  memcpy(entries, field->entries,
         (field->size - 1) * sizeof(struct hashmap_entry));

  entry = &entries[field->size - 1];
  /* BUG-7 */ /* Fixes 7*/
  entry->key = (char *)malloc(strlen(key) + 1);
  strcpy(entry->key, key);

  field->entries = entries;

set_val:
  /* BUG-2 */
  if (value != NULL) {
    /* BUG-10 */
    void *val = malloc(length);
    /* Fixes 10*/
    if(!val) {
      exit(1);
    }

    entry->val = memcpy(val, value, length);
    entry->len = length;
    /* Fixes 2*/
    // free(val);
    // free(entry->key);
    // free(field->entries);
  } else {
    free(entry->key);
    field->size--;
    if (entry != (field->entries + field->size)) {
      memcpy((void *)entry, (void *)(field->entries + field->size),
             sizeof(struct hashmap_entry));
    }
    /* BUG-11 */
    field->entries = realloc((void *)field->entries,
                             field->size * sizeof(struct hashmap_entry));
    /* Fixes 11*/
    if (!field->entries) {
      exit(1);
    }
  }
}

void *hashmap_get(hashmap_t map, char *key) {
  int hash = hashmap_hash(key, map->size - 1);
  struct hashmap_field *field = map->fields + hash;
  struct hashmap_entry *entry;

  int i;
  for (i = 0; i < field->size; i++) {
    entry = field->entries + i;
    if (strcmp(entry->key, key) == 0) {
      void *val = malloc(entry->len);
      /* Fixes 4*/
      if (!val) {
        exit(1);
      }
       /* Fixes 3*/
      // memcpy(val, entry->val, entry->len);
      // return val;
      // comment line 200

      /* BUG-3 */ /* BUG-4 */
      return memcpy(val, entry->val, entry->len);
    }
  }
  return NULL;
}

int main() {
  /* BUG-5 */
  hashmap_t map = hashmap_new(8);

  char *key = "42";
  int value = 42;
  hashmap_set(map, key, &value, sizeof(int));

  int *ret = (int *)hashmap_get(map, key);
  /* BUG-8 */ 
  assert(*ret == value);

  /* Fixes 8*/
  free(ret);

  hashmap_free(map);
  return 0;
}
