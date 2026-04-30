#include "types.h"
#include "stat.h"
#include "user.h"
#include "uthread.h"

#define TS_FREE     0
#define TS_RUNNABLE 1
#define TS_RUNNING  2
#define TS_ZOMBIE   3

struct thread {
    tid_t  tid;
    int    state;
    uint  *saved_esp;
    char   stack[STACK_SIZE];
};

static struct thread table[MAX_THREADS];
static int cur;
static int next_tid;

void uswtch(uint **old_esp, uint *new_esp);

/* Each new thread starts here */
static void thread_stub(void (*fn)(void*), void *arg)
{
    fn(arg);
    table[cur].state = TS_ZOMBIE;
    while(1)
        thread_yield();
}

void thread_init(void)
{
    int i;
    for(i = 0; i < MAX_THREADS; i++)
        table[i].state = TS_FREE;
    table[0].tid   = next_tid++;
    table[0].state = TS_RUNNING;
    cur = 0;
}

tid_t thread_create(void (*fn)(void*), void *arg)
{
    int i;
    for(i = 0; i < MAX_THREADS; i++)
        if(table[i].state == TS_FREE) break;
    if(i == MAX_THREADS) return -1;

    uint *sp = (uint*)(table[i].stack + STACK_SIZE);

    /* Build call frame for thread_stub(fn, arg):
     * uswtch restore does: pop edi,esi,ebx,ebp then ret
     * ret pops eip -> thread_stub
     * thread_stub sees its args at esp+4 and esp+8
     */
    *(--sp) = (uint)arg;         /* arg for thread_stub    */
    *(--sp) = (uint)fn;          /* fn for thread_stub     */
    *(--sp) = 0xffffffff;        /* fake return address    */
    *(--sp) = (uint)thread_stub; /* eip: ret jumps here    */
    *(--sp) = 0;                 /* ebp                    */
    *(--sp) = 0;                 /* ebx                    */
    *(--sp) = 0;                 /* esi                    */
    *(--sp) = 0;                 /* edi  <- saved_esp here */

    table[i].saved_esp = sp;
    table[i].tid       = next_tid++;
    table[i].state     = TS_RUNNABLE;
    return table[i].tid;
}

static int pick_next(void)
{
    int i;
    for(i = 1; i <= MAX_THREADS; i++){
        int idx = (cur + i) % MAX_THREADS;
        if(table[idx].state == TS_RUNNABLE)
            return idx;
    }
    return -1;
}

void thread_yield(void)
{
    int old  = cur;
    int next = pick_next();
    if(next == -1) return;

    table[old].state  = TS_RUNNABLE;
    table[next].state = TS_RUNNING;
    cur = next;

    uswtch(&table[old].saved_esp, table[next].saved_esp);
}

int thread_join(tid_t tid)
{
    int i;
    for(i = 0; i < MAX_THREADS; i++)
        if(table[i].tid == tid) break;
    if(i == MAX_THREADS) return -1;

    while(table[i].state != TS_ZOMBIE)
        thread_yield();

    table[i].state = TS_FREE;
    return 0;
}