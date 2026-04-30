#pragma once

typedef int tid_t;

#define MAX_THREADS 8
#define STACK_SIZE  4096

void  thread_init(void);
tid_t thread_create(void (*fn)(void*), void *arg);
void  thread_yield(void);
int   thread_join(tid_t tid);

/* assembly context switch */
void uswtch(uint **old_esp, uint *new_esp);