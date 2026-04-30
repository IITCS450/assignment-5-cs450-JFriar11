#include "types.h"
#include "stat.h"
#include "user.h"
#include "uthread.h"
#include "umutex.h"

#define N          8
#define PROD_ITEMS 100
#define NUM_PROD   2
#define TOTAL      (NUM_PROD * PROD_ITEMS)

static int buf[N], head, tail, count;
static umutex_t mu;
static int total_produced;
static int total_consumed;

static void producer(void *arg)
{
    int id = (int)(uint)arg;
    int i;
    for (i = 0; i < PROD_ITEMS; i++) {
        for (;;) {
            mutex_lock(&mu);
            if (count < N) break;
            mutex_unlock(&mu);
            thread_yield();
        }
        buf[tail] = id * 1000 + i;
        tail = (tail + 1) % N;
        count++;
        total_produced++;
        mutex_unlock(&mu);
        thread_yield();
    }
}

static void consumer(void *arg)
{
    int id  = (int)(uint)arg;
    int got = 0;
    while (got < PROD_ITEMS) {
        mutex_lock(&mu);
        if (count > 0) {
            int x = buf[head];
            head = (head + 1) % N;
            count--;
            total_consumed++;
            got++;
            mutex_unlock(&mu);
            if (got % 25 == 0)
                printf(1, "consumer %d: got %d items (last=%d)\n", id, got, x);
        } else {
            mutex_unlock(&mu);
        }
        thread_yield();
    }
}

int main(void)
{
    thread_init();
    mutex_init(&mu);
    head = tail = count = total_produced = total_consumed = 0;

    tid_t p1 = thread_create(producer, (void*)1);
    tid_t p2 = thread_create(producer, (void*)2);
    tid_t c1 = thread_create(consumer, (void*)1);
    tid_t c2 = thread_create(consumer, (void*)2);

    while(thread_join(p1) != 0) thread_yield();
    while(thread_join(p2) != 0) thread_yield();
    while(thread_join(c1) != 0) thread_yield();
    while(thread_join(c2) != 0) thread_yield();

    printf(1, "\n=== test_pc results ===\n");
    printf(1, "total produced: %d (expected %d)\n", total_produced, TOTAL);
    printf(1, "total consumed: %d (expected %d)\n", total_consumed, TOTAL);
    if (total_produced == TOTAL && total_consumed == TOTAL)
        printf(1, "PASS\n");
    else
        printf(1, "FAIL\n");
    exit();
}