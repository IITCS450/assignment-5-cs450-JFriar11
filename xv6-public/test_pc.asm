
_test_pc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
        thread_yield();
    }
}

int main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
    thread_init();
  14:	e8 a7 09 00 00       	call   9c0 <thread_init>
    mutex_init(&mu);
  19:	83 ec 0c             	sub    $0xc,%esp
  1c:	68 a8 11 00 00       	push   $0x11a8
  21:	e8 fa 0b 00 00       	call   c20 <mutex_init>
    head = tail = count = total_produced = total_consumed = 0;

    tid_t p1 = thread_create(producer, (void*)1);
  26:	5a                   	pop    %edx
  27:	59                   	pop    %ecx
  28:	6a 01                	push   $0x1
  2a:	68 80 02 00 00       	push   $0x280
    head = tail = count = total_produced = total_consumed = 0;
  2f:	c7 05 a0 11 00 00 00 	movl   $0x0,0x11a0
  36:	00 00 00 
  39:	c7 05 a4 11 00 00 00 	movl   $0x0,0x11a4
  40:	00 00 00 
  43:	c7 05 ac 11 00 00 00 	movl   $0x0,0x11ac
  4a:	00 00 00 
  4d:	c7 05 b0 11 00 00 00 	movl   $0x0,0x11b0
  54:	00 00 00 
  57:	c7 05 b4 11 00 00 00 	movl   $0x0,0x11b4
  5e:	00 00 00 
    tid_t p1 = thread_create(producer, (void*)1);
  61:	e8 ca 09 00 00       	call   a30 <thread_create>
    tid_t p2 = thread_create(producer, (void*)2);
  66:	5b                   	pop    %ebx
  67:	5e                   	pop    %esi
  68:	6a 02                	push   $0x2
  6a:	68 80 02 00 00       	push   $0x280
    tid_t p1 = thread_create(producer, (void*)1);
  6f:	89 c7                	mov    %eax,%edi
    tid_t p2 = thread_create(producer, (void*)2);
  71:	e8 ba 09 00 00       	call   a30 <thread_create>
  76:	89 c6                	mov    %eax,%esi
    tid_t c1 = thread_create(consumer, (void*)1);
  78:	58                   	pop    %eax
  79:	5a                   	pop    %edx
  7a:	6a 01                	push   $0x1
  7c:	68 b0 01 00 00       	push   $0x1b0
  81:	e8 aa 09 00 00       	call   a30 <thread_create>
    tid_t c2 = thread_create(consumer, (void*)2);
  86:	59                   	pop    %ecx
    tid_t c1 = thread_create(consumer, (void*)1);
  87:	89 c3                	mov    %eax,%ebx
    tid_t c2 = thread_create(consumer, (void*)2);
  89:	58                   	pop    %eax
  8a:	6a 02                	push   $0x2
  8c:	68 b0 01 00 00       	push   $0x1b0
  91:	e8 9a 09 00 00       	call   a30 <thread_create>

    while(thread_join(p1) != 0) thread_yield();
  96:	83 c4 10             	add    $0x10,%esp
    tid_t c2 = thread_create(consumer, (void*)2);
  99:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    while(thread_join(p1) != 0) thread_yield();
  9c:	eb 07                	jmp    a5 <main+0xa5>
  9e:	66 90                	xchg   %ax,%ax
  a0:	e8 4b 0a 00 00       	call   af0 <thread_yield>
  a5:	83 ec 0c             	sub    $0xc,%esp
  a8:	57                   	push   %edi
  a9:	e8 02 0b 00 00       	call   bb0 <thread_join>
  ae:	83 c4 10             	add    $0x10,%esp
  b1:	85 c0                	test   %eax,%eax
  b3:	75 eb                	jne    a0 <main+0xa0>
    while(thread_join(p2) != 0) thread_yield();
  b5:	83 ec 0c             	sub    $0xc,%esp
  b8:	56                   	push   %esi
  b9:	e8 f2 0a 00 00       	call   bb0 <thread_join>
  be:	83 c4 10             	add    $0x10,%esp
  c1:	85 c0                	test   %eax,%eax
  c3:	74 30                	je     f5 <main+0xf5>
  c5:	8d 76 00             	lea    0x0(%esi),%esi
  c8:	e8 23 0a 00 00       	call   af0 <thread_yield>
  cd:	83 ec 0c             	sub    $0xc,%esp
  d0:	56                   	push   %esi
  d1:	e8 da 0a 00 00       	call   bb0 <thread_join>
  d6:	83 c4 10             	add    $0x10,%esp
  d9:	85 c0                	test   %eax,%eax
  db:	75 eb                	jne    c8 <main+0xc8>
    while(thread_join(c1) != 0) thread_yield();
  dd:	83 ec 0c             	sub    $0xc,%esp
  e0:	53                   	push   %ebx
  e1:	e8 ca 0a 00 00       	call   bb0 <thread_join>
  e6:	83 c4 10             	add    $0x10,%esp
  e9:	85 c0                	test   %eax,%eax
  eb:	74 28                	je     115 <main+0x115>
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  f0:	e8 fb 09 00 00       	call   af0 <thread_yield>
  f5:	83 ec 0c             	sub    $0xc,%esp
  f8:	53                   	push   %ebx
  f9:	e8 b2 0a 00 00       	call   bb0 <thread_join>
  fe:	83 c4 10             	add    $0x10,%esp
 101:	85 c0                	test   %eax,%eax
 103:	75 eb                	jne    f0 <main+0xf0>
 105:	eb 0e                	jmp    115 <main+0x115>
 107:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 10e:	00 
 10f:	90                   	nop
    while(thread_join(c2) != 0) thread_yield();
 110:	e8 db 09 00 00       	call   af0 <thread_yield>
 115:	83 ec 0c             	sub    $0xc,%esp
 118:	ff 75 e4             	push   -0x1c(%ebp)
 11b:	e8 90 0a 00 00       	call   bb0 <thread_join>
 120:	83 c4 10             	add    $0x10,%esp
 123:	85 c0                	test   %eax,%eax
 125:	75 e9                	jne    110 <main+0x110>

    printf(1, "\n=== test_pc results ===\n");
 127:	83 ec 08             	sub    $0x8,%esp
 12a:	68 f2 0c 00 00       	push   $0xcf2
 12f:	6a 01                	push   $0x1
 131:	e8 7a 05 00 00       	call   6b0 <printf>
    printf(1, "total produced: %d (expected %d)\n", total_produced, TOTAL);
 136:	68 c8 00 00 00       	push   $0xc8
 13b:	ff 35 a4 11 00 00    	push   0x11a4
 141:	68 ac 0c 00 00       	push   $0xcac
 146:	6a 01                	push   $0x1
 148:	e8 63 05 00 00       	call   6b0 <printf>
    printf(1, "total consumed: %d (expected %d)\n", total_consumed, TOTAL);
 14d:	83 c4 20             	add    $0x20,%esp
 150:	68 c8 00 00 00       	push   $0xc8
 155:	ff 35 a0 11 00 00    	push   0x11a0
 15b:	68 d0 0c 00 00       	push   $0xcd0
 160:	6a 01                	push   $0x1
 162:	e8 49 05 00 00       	call   6b0 <printf>
    if (total_produced == TOTAL && total_consumed == TOTAL)
 167:	83 c4 10             	add    $0x10,%esp
 16a:	81 3d a4 11 00 00 c8 	cmpl   $0xc8,0x11a4
 171:	00 00 00 
 174:	75 0c                	jne    182 <main+0x182>
 176:	81 3d a0 11 00 00 c8 	cmpl   $0xc8,0x11a0
 17d:	00 00 00 
 180:	74 17                	je     199 <main+0x199>
        printf(1, "PASS\n");
    else
        printf(1, "FAIL\n");
 182:	83 ec 08             	sub    $0x8,%esp
 185:	68 12 0d 00 00       	push   $0xd12
 18a:	6a 01                	push   $0x1
 18c:	e8 1f 05 00 00       	call   6b0 <printf>
 191:	83 c4 10             	add    $0x10,%esp
    exit();
 194:	e8 ca 03 00 00       	call   563 <exit>
        printf(1, "PASS\n");
 199:	50                   	push   %eax
 19a:	50                   	push   %eax
 19b:	68 0c 0d 00 00       	push   $0xd0c
 1a0:	6a 01                	push   $0x1
 1a2:	e8 09 05 00 00       	call   6b0 <printf>
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	eb e8                	jmp    194 <main+0x194>
 1ac:	66 90                	xchg   %ax,%ax
 1ae:	66 90                	xchg   %ax,%ax

000001b0 <consumer>:
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	56                   	push   %esi
 1b5:	53                   	push   %ebx
    int got = 0;
 1b6:	31 db                	xor    %ebx,%ebx
{
 1b8:	83 ec 0c             	sub    $0xc,%esp
 1bb:	8b 7d 08             	mov    0x8(%ebp),%edi
    while (got < PROD_ITEMS) {
 1be:	66 90                	xchg   %ax,%ax
        mutex_lock(&mu);
 1c0:	83 ec 0c             	sub    $0xc,%esp
 1c3:	68 a8 11 00 00       	push   $0x11a8
 1c8:	e8 63 0a 00 00       	call   c30 <mutex_lock>
        if (count > 0) {
 1cd:	8b 15 ac 11 00 00    	mov    0x11ac,%edx
 1d3:	83 c4 10             	add    $0x10,%esp
 1d6:	85 d2                	test   %edx,%edx
 1d8:	7e 6e                	jle    248 <consumer+0x98>
            int x = buf[head];
 1da:	a1 b4 11 00 00       	mov    0x11b4,%eax
            mutex_unlock(&mu);
 1df:	83 ec 0c             	sub    $0xc,%esp
            count--;
 1e2:	83 ea 01             	sub    $0x1,%edx
            got++;
 1e5:	83 c3 01             	add    $0x1,%ebx
            total_consumed++;
 1e8:	83 05 a0 11 00 00 01 	addl   $0x1,0x11a0
            int x = buf[head];
 1ef:	8b 34 85 c0 11 00 00 	mov    0x11c0(,%eax,4),%esi
            head = (head + 1) % N;
 1f6:	83 c0 01             	add    $0x1,%eax
            count--;
 1f9:	89 15 ac 11 00 00    	mov    %edx,0x11ac
            head = (head + 1) % N;
 1ff:	89 c1                	mov    %eax,%ecx
 201:	c1 f9 1f             	sar    $0x1f,%ecx
 204:	c1 e9 1d             	shr    $0x1d,%ecx
 207:	01 c8                	add    %ecx,%eax
 209:	83 e0 07             	and    $0x7,%eax
 20c:	29 c8                	sub    %ecx,%eax
 20e:	a3 b4 11 00 00       	mov    %eax,0x11b4
            mutex_unlock(&mu);
 213:	68 a8 11 00 00       	push   $0x11a8
 218:	e8 43 0a 00 00       	call   c60 <mutex_unlock>
 21d:	69 c3 29 5c 8f c2    	imul   $0xc28f5c29,%ebx,%eax
 223:	83 c4 10             	add    $0x10,%esp
 226:	05 51 b8 1e 05       	add    $0x51eb851,%eax
            if (got % 25 == 0)
 22b:	3d a2 70 3d 0a       	cmp    $0xa3d70a2,%eax
 230:	76 36                	jbe    268 <consumer+0xb8>
        thread_yield();
 232:	e8 b9 08 00 00       	call   af0 <thread_yield>
    while (got < PROD_ITEMS) {
 237:	83 fb 64             	cmp    $0x64,%ebx
 23a:	75 84                	jne    1c0 <consumer+0x10>
}
 23c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 23f:	5b                   	pop    %ebx
 240:	5e                   	pop    %esi
 241:	5f                   	pop    %edi
 242:	5d                   	pop    %ebp
 243:	c3                   	ret
 244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            mutex_unlock(&mu);
 248:	83 ec 0c             	sub    $0xc,%esp
 24b:	68 a8 11 00 00       	push   $0x11a8
 250:	e8 0b 0a 00 00       	call   c60 <mutex_unlock>
        thread_yield();
 255:	e8 96 08 00 00       	call   af0 <thread_yield>
 25a:	83 c4 10             	add    $0x10,%esp
 25d:	e9 5e ff ff ff       	jmp    1c0 <consumer+0x10>
 262:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                printf(1, "consumer %d: got %d items (last=%d)\n", id, got, x);
 268:	83 ec 0c             	sub    $0xc,%esp
 26b:	56                   	push   %esi
 26c:	53                   	push   %ebx
 26d:	57                   	push   %edi
 26e:	68 84 0c 00 00       	push   $0xc84
 273:	6a 01                	push   $0x1
 275:	e8 36 04 00 00       	call   6b0 <printf>
 27a:	83 c4 20             	add    $0x20,%esp
 27d:	eb b3                	jmp    232 <consumer+0x82>
 27f:	90                   	nop

00000280 <producer>:
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
        buf[tail] = id * 1000 + i;
 285:	69 5d 08 e8 03 00 00 	imul   $0x3e8,0x8(%ebp),%ebx
 28c:	8d 73 64             	lea    0x64(%ebx),%esi
 28f:	eb 1c                	jmp    2ad <producer+0x2d>
 291:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            mutex_unlock(&mu);
 298:	83 ec 0c             	sub    $0xc,%esp
 29b:	68 a8 11 00 00       	push   $0x11a8
 2a0:	e8 bb 09 00 00       	call   c60 <mutex_unlock>
            thread_yield();
 2a5:	e8 46 08 00 00       	call   af0 <thread_yield>
            mutex_lock(&mu);
 2aa:	83 c4 10             	add    $0x10,%esp
 2ad:	83 ec 0c             	sub    $0xc,%esp
 2b0:	68 a8 11 00 00       	push   $0x11a8
 2b5:	e8 76 09 00 00       	call   c30 <mutex_lock>
            if (count < N) break;
 2ba:	a1 ac 11 00 00       	mov    0x11ac,%eax
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	83 f8 07             	cmp    $0x7,%eax
 2c5:	7f d1                	jg     298 <producer+0x18>
        buf[tail] = id * 1000 + i;
 2c7:	8b 15 b0 11 00 00    	mov    0x11b0,%edx
        mutex_unlock(&mu);
 2cd:	83 ec 0c             	sub    $0xc,%esp
        count++;
 2d0:	83 c0 01             	add    $0x1,%eax
        total_produced++;
 2d3:	83 05 a4 11 00 00 01 	addl   $0x1,0x11a4
        count++;
 2da:	a3 ac 11 00 00       	mov    %eax,0x11ac
        buf[tail] = id * 1000 + i;
 2df:	89 1c 95 c0 11 00 00 	mov    %ebx,0x11c0(,%edx,4)
        tail = (tail + 1) % N;
 2e6:	83 c2 01             	add    $0x1,%edx
    for (i = 0; i < PROD_ITEMS; i++) {
 2e9:	83 c3 01             	add    $0x1,%ebx
        tail = (tail + 1) % N;
 2ec:	89 d1                	mov    %edx,%ecx
 2ee:	c1 f9 1f             	sar    $0x1f,%ecx
 2f1:	c1 e9 1d             	shr    $0x1d,%ecx
 2f4:	01 ca                	add    %ecx,%edx
 2f6:	83 e2 07             	and    $0x7,%edx
 2f9:	29 ca                	sub    %ecx,%edx
 2fb:	89 15 b0 11 00 00    	mov    %edx,0x11b0
        mutex_unlock(&mu);
 301:	68 a8 11 00 00       	push   $0x11a8
 306:	e8 55 09 00 00       	call   c60 <mutex_unlock>
        thread_yield();
 30b:	e8 e0 07 00 00       	call   af0 <thread_yield>
    for (i = 0; i < PROD_ITEMS; i++) {
 310:	83 c4 10             	add    $0x10,%esp
 313:	39 f3                	cmp    %esi,%ebx
 315:	75 96                	jne    2ad <producer+0x2d>
}
 317:	8d 65 f8             	lea    -0x8(%ebp),%esp
 31a:	5b                   	pop    %ebx
 31b:	5e                   	pop    %esi
 31c:	5d                   	pop    %ebp
 31d:	c3                   	ret
 31e:	66 90                	xchg   %ax,%ax

00000320 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 320:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 321:	31 c0                	xor    %eax,%eax
{
 323:	89 e5                	mov    %esp,%ebp
 325:	53                   	push   %ebx
 326:	8b 4d 08             	mov    0x8(%ebp),%ecx
 329:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 330:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 334:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 337:	83 c0 01             	add    $0x1,%eax
 33a:	84 d2                	test   %dl,%dl
 33c:	75 f2                	jne    330 <strcpy+0x10>
    ;
  return os;
}
 33e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 341:	89 c8                	mov    %ecx,%eax
 343:	c9                   	leave
 344:	c3                   	ret
 345:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 34c:	00 
 34d:	8d 76 00             	lea    0x0(%esi),%esi

00000350 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	53                   	push   %ebx
 354:	8b 55 08             	mov    0x8(%ebp),%edx
 357:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 35a:	0f b6 02             	movzbl (%edx),%eax
 35d:	84 c0                	test   %al,%al
 35f:	75 17                	jne    378 <strcmp+0x28>
 361:	eb 3a                	jmp    39d <strcmp+0x4d>
 363:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 368:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 36c:	83 c2 01             	add    $0x1,%edx
 36f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 372:	84 c0                	test   %al,%al
 374:	74 1a                	je     390 <strcmp+0x40>
 376:	89 d9                	mov    %ebx,%ecx
 378:	0f b6 19             	movzbl (%ecx),%ebx
 37b:	38 c3                	cmp    %al,%bl
 37d:	74 e9                	je     368 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 37f:	29 d8                	sub    %ebx,%eax
}
 381:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 384:	c9                   	leave
 385:	c3                   	ret
 386:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 38d:	00 
 38e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 390:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 394:	31 c0                	xor    %eax,%eax
 396:	29 d8                	sub    %ebx,%eax
}
 398:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 39b:	c9                   	leave
 39c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 39d:	0f b6 19             	movzbl (%ecx),%ebx
 3a0:	31 c0                	xor    %eax,%eax
 3a2:	eb db                	jmp    37f <strcmp+0x2f>
 3a4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ab:	00 
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003b0 <strlen>:

uint
strlen(const char *s)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 3b6:	80 3a 00             	cmpb   $0x0,(%edx)
 3b9:	74 15                	je     3d0 <strlen+0x20>
 3bb:	31 c0                	xor    %eax,%eax
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
 3c0:	83 c0 01             	add    $0x1,%eax
 3c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3c7:	89 c1                	mov    %eax,%ecx
 3c9:	75 f5                	jne    3c0 <strlen+0x10>
    ;
  return n;
}
 3cb:	89 c8                	mov    %ecx,%eax
 3cd:	5d                   	pop    %ebp
 3ce:	c3                   	ret
 3cf:	90                   	nop
  for(n = 0; s[n]; n++)
 3d0:	31 c9                	xor    %ecx,%ecx
}
 3d2:	5d                   	pop    %ebp
 3d3:	89 c8                	mov    %ecx,%eax
 3d5:	c3                   	ret
 3d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3dd:	00 
 3de:	66 90                	xchg   %ax,%ax

000003e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ed:	89 d7                	mov    %edx,%edi
 3ef:	fc                   	cld
 3f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3f2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3f5:	89 d0                	mov    %edx,%eax
 3f7:	c9                   	leave
 3f8:	c3                   	ret
 3f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000400 <strchr>:

char*
strchr(const char *s, char c)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	8b 45 08             	mov    0x8(%ebp),%eax
 406:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 40a:	0f b6 10             	movzbl (%eax),%edx
 40d:	84 d2                	test   %dl,%dl
 40f:	75 12                	jne    423 <strchr+0x23>
 411:	eb 1d                	jmp    430 <strchr+0x30>
 413:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 418:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 41c:	83 c0 01             	add    $0x1,%eax
 41f:	84 d2                	test   %dl,%dl
 421:	74 0d                	je     430 <strchr+0x30>
    if(*s == c)
 423:	38 d1                	cmp    %dl,%cl
 425:	75 f1                	jne    418 <strchr+0x18>
      return (char*)s;
  return 0;
}
 427:	5d                   	pop    %ebp
 428:	c3                   	ret
 429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 430:	31 c0                	xor    %eax,%eax
}
 432:	5d                   	pop    %ebp
 433:	c3                   	ret
 434:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 43b:	00 
 43c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000440 <gets>:

char*
gets(char *buf, int max)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 445:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 448:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 449:	31 db                	xor    %ebx,%ebx
{
 44b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 44e:	eb 27                	jmp    477 <gets+0x37>
    cc = read(0, &c, 1);
 450:	83 ec 04             	sub    $0x4,%esp
 453:	6a 01                	push   $0x1
 455:	56                   	push   %esi
 456:	6a 00                	push   $0x0
 458:	e8 1e 01 00 00       	call   57b <read>
    if(cc < 1)
 45d:	83 c4 10             	add    $0x10,%esp
 460:	85 c0                	test   %eax,%eax
 462:	7e 1d                	jle    481 <gets+0x41>
      break;
    buf[i++] = c;
 464:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 468:	8b 55 08             	mov    0x8(%ebp),%edx
 46b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 46f:	3c 0a                	cmp    $0xa,%al
 471:	74 10                	je     483 <gets+0x43>
 473:	3c 0d                	cmp    $0xd,%al
 475:	74 0c                	je     483 <gets+0x43>
  for(i=0; i+1 < max; ){
 477:	89 df                	mov    %ebx,%edi
 479:	83 c3 01             	add    $0x1,%ebx
 47c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 47f:	7c cf                	jl     450 <gets+0x10>
 481:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 483:	8b 45 08             	mov    0x8(%ebp),%eax
 486:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 48a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 48d:	5b                   	pop    %ebx
 48e:	5e                   	pop    %esi
 48f:	5f                   	pop    %edi
 490:	5d                   	pop    %ebp
 491:	c3                   	ret
 492:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 499:	00 
 49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	56                   	push   %esi
 4a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4a5:	83 ec 08             	sub    $0x8,%esp
 4a8:	6a 00                	push   $0x0
 4aa:	ff 75 08             	push   0x8(%ebp)
 4ad:	e8 f1 00 00 00       	call   5a3 <open>
  if(fd < 0)
 4b2:	83 c4 10             	add    $0x10,%esp
 4b5:	85 c0                	test   %eax,%eax
 4b7:	78 27                	js     4e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4b9:	83 ec 08             	sub    $0x8,%esp
 4bc:	ff 75 0c             	push   0xc(%ebp)
 4bf:	89 c3                	mov    %eax,%ebx
 4c1:	50                   	push   %eax
 4c2:	e8 f4 00 00 00       	call   5bb <fstat>
  close(fd);
 4c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4ca:	89 c6                	mov    %eax,%esi
  close(fd);
 4cc:	e8 ba 00 00 00       	call   58b <close>
  return r;
 4d1:	83 c4 10             	add    $0x10,%esp
}
 4d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4d7:	89 f0                	mov    %esi,%eax
 4d9:	5b                   	pop    %ebx
 4da:	5e                   	pop    %esi
 4db:	5d                   	pop    %ebp
 4dc:	c3                   	ret
 4dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 4e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4e5:	eb ed                	jmp    4d4 <stat+0x34>
 4e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4ee:	00 
 4ef:	90                   	nop

000004f0 <atoi>:

int
atoi(const char *s)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	53                   	push   %ebx
 4f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4f7:	0f be 02             	movsbl (%edx),%eax
 4fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 4fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 500:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 505:	77 1e                	ja     525 <atoi+0x35>
 507:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 50e:	00 
 50f:	90                   	nop
    n = n*10 + *s++ - '0';
 510:	83 c2 01             	add    $0x1,%edx
 513:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 516:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 51a:	0f be 02             	movsbl (%edx),%eax
 51d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 520:	80 fb 09             	cmp    $0x9,%bl
 523:	76 eb                	jbe    510 <atoi+0x20>
  return n;
}
 525:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 528:	89 c8                	mov    %ecx,%eax
 52a:	c9                   	leave
 52b:	c3                   	ret
 52c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000530 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	8b 45 10             	mov    0x10(%ebp),%eax
 537:	8b 55 08             	mov    0x8(%ebp),%edx
 53a:	56                   	push   %esi
 53b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 53e:	85 c0                	test   %eax,%eax
 540:	7e 13                	jle    555 <memmove+0x25>
 542:	01 d0                	add    %edx,%eax
  dst = vdst;
 544:	89 d7                	mov    %edx,%edi
 546:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 54d:	00 
 54e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 550:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 551:	39 f8                	cmp    %edi,%eax
 553:	75 fb                	jne    550 <memmove+0x20>
  return vdst;
}
 555:	5e                   	pop    %esi
 556:	89 d0                	mov    %edx,%eax
 558:	5f                   	pop    %edi
 559:	5d                   	pop    %ebp
 55a:	c3                   	ret

0000055b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 55b:	b8 01 00 00 00       	mov    $0x1,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret

00000563 <exit>:
SYSCALL(exit)
 563:	b8 02 00 00 00       	mov    $0x2,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret

0000056b <wait>:
SYSCALL(wait)
 56b:	b8 03 00 00 00       	mov    $0x3,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret

00000573 <pipe>:
SYSCALL(pipe)
 573:	b8 04 00 00 00       	mov    $0x4,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret

0000057b <read>:
SYSCALL(read)
 57b:	b8 05 00 00 00       	mov    $0x5,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret

00000583 <write>:
SYSCALL(write)
 583:	b8 10 00 00 00       	mov    $0x10,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret

0000058b <close>:
SYSCALL(close)
 58b:	b8 15 00 00 00       	mov    $0x15,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret

00000593 <kill>:
SYSCALL(kill)
 593:	b8 06 00 00 00       	mov    $0x6,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret

0000059b <exec>:
SYSCALL(exec)
 59b:	b8 07 00 00 00       	mov    $0x7,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret

000005a3 <open>:
SYSCALL(open)
 5a3:	b8 0f 00 00 00       	mov    $0xf,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret

000005ab <mknod>:
SYSCALL(mknod)
 5ab:	b8 11 00 00 00       	mov    $0x11,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret

000005b3 <unlink>:
SYSCALL(unlink)
 5b3:	b8 12 00 00 00       	mov    $0x12,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret

000005bb <fstat>:
SYSCALL(fstat)
 5bb:	b8 08 00 00 00       	mov    $0x8,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret

000005c3 <link>:
SYSCALL(link)
 5c3:	b8 13 00 00 00       	mov    $0x13,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret

000005cb <mkdir>:
SYSCALL(mkdir)
 5cb:	b8 14 00 00 00       	mov    $0x14,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret

000005d3 <chdir>:
SYSCALL(chdir)
 5d3:	b8 09 00 00 00       	mov    $0x9,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret

000005db <dup>:
SYSCALL(dup)
 5db:	b8 0a 00 00 00       	mov    $0xa,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret

000005e3 <getpid>:
SYSCALL(getpid)
 5e3:	b8 0b 00 00 00       	mov    $0xb,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret

000005eb <sbrk>:
SYSCALL(sbrk)
 5eb:	b8 0c 00 00 00       	mov    $0xc,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret

000005f3 <sleep>:
SYSCALL(sleep)
 5f3:	b8 0d 00 00 00       	mov    $0xd,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret

000005fb <uptime>:
SYSCALL(uptime)
 5fb:	b8 0e 00 00 00       	mov    $0xe,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret

00000603 <symlink>:
 603:	b8 16 00 00 00       	mov    $0x16,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret
 60b:	66 90                	xchg   %ax,%ax
 60d:	66 90                	xchg   %ax,%ax
 60f:	90                   	nop

00000610 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	57                   	push   %edi
 614:	56                   	push   %esi
 615:	53                   	push   %ebx
 616:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 618:	89 d1                	mov    %edx,%ecx
{
 61a:	83 ec 3c             	sub    $0x3c,%esp
 61d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 620:	85 d2                	test   %edx,%edx
 622:	0f 89 80 00 00 00    	jns    6a8 <printint+0x98>
 628:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 62c:	74 7a                	je     6a8 <printint+0x98>
    x = -xx;
 62e:	f7 d9                	neg    %ecx
    neg = 1;
 630:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 635:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 638:	31 f6                	xor    %esi,%esi
 63a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 640:	89 c8                	mov    %ecx,%eax
 642:	31 d2                	xor    %edx,%edx
 644:	89 f7                	mov    %esi,%edi
 646:	f7 f3                	div    %ebx
 648:	8d 76 01             	lea    0x1(%esi),%esi
 64b:	0f b6 92 78 0d 00 00 	movzbl 0xd78(%edx),%edx
 652:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 656:	89 ca                	mov    %ecx,%edx
 658:	89 c1                	mov    %eax,%ecx
 65a:	39 da                	cmp    %ebx,%edx
 65c:	73 e2                	jae    640 <printint+0x30>
  if(neg)
 65e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 661:	85 c0                	test   %eax,%eax
 663:	74 07                	je     66c <printint+0x5c>
    buf[i++] = '-';
 665:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 66a:	89 f7                	mov    %esi,%edi
 66c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 66f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 672:	01 df                	add    %ebx,%edi
 674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 678:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 67b:	83 ec 04             	sub    $0x4,%esp
 67e:	88 45 d7             	mov    %al,-0x29(%ebp)
 681:	8d 45 d7             	lea    -0x29(%ebp),%eax
 684:	6a 01                	push   $0x1
 686:	50                   	push   %eax
 687:	56                   	push   %esi
 688:	e8 f6 fe ff ff       	call   583 <write>
  while(--i >= 0)
 68d:	89 f8                	mov    %edi,%eax
 68f:	83 c4 10             	add    $0x10,%esp
 692:	83 ef 01             	sub    $0x1,%edi
 695:	39 c3                	cmp    %eax,%ebx
 697:	75 df                	jne    678 <printint+0x68>
}
 699:	8d 65 f4             	lea    -0xc(%ebp),%esp
 69c:	5b                   	pop    %ebx
 69d:	5e                   	pop    %esi
 69e:	5f                   	pop    %edi
 69f:	5d                   	pop    %ebp
 6a0:	c3                   	ret
 6a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6a8:	31 c0                	xor    %eax,%eax
 6aa:	eb 89                	jmp    635 <printint+0x25>
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	56                   	push   %esi
 6b5:	53                   	push   %ebx
 6b6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6b9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 6bc:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 6bf:	0f b6 1e             	movzbl (%esi),%ebx
 6c2:	83 c6 01             	add    $0x1,%esi
 6c5:	84 db                	test   %bl,%bl
 6c7:	74 67                	je     730 <printf+0x80>
 6c9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 6cc:	31 d2                	xor    %edx,%edx
 6ce:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 6d1:	eb 34                	jmp    707 <printf+0x57>
 6d3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 6d8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6db:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 6e0:	83 f8 25             	cmp    $0x25,%eax
 6e3:	74 18                	je     6fd <printf+0x4d>
  write(fd, &c, 1);
 6e5:	83 ec 04             	sub    $0x4,%esp
 6e8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 6eb:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6ee:	6a 01                	push   $0x1
 6f0:	50                   	push   %eax
 6f1:	57                   	push   %edi
 6f2:	e8 8c fe ff ff       	call   583 <write>
 6f7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 6fa:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6fd:	0f b6 1e             	movzbl (%esi),%ebx
 700:	83 c6 01             	add    $0x1,%esi
 703:	84 db                	test   %bl,%bl
 705:	74 29                	je     730 <printf+0x80>
    c = fmt[i] & 0xff;
 707:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 70a:	85 d2                	test   %edx,%edx
 70c:	74 ca                	je     6d8 <printf+0x28>
      }
    } else if(state == '%'){
 70e:	83 fa 25             	cmp    $0x25,%edx
 711:	75 ea                	jne    6fd <printf+0x4d>
      if(c == 'd'){
 713:	83 f8 25             	cmp    $0x25,%eax
 716:	0f 84 04 01 00 00    	je     820 <printf+0x170>
 71c:	83 e8 63             	sub    $0x63,%eax
 71f:	83 f8 15             	cmp    $0x15,%eax
 722:	77 1c                	ja     740 <printf+0x90>
 724:	ff 24 85 20 0d 00 00 	jmp    *0xd20(,%eax,4)
 72b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 730:	8d 65 f4             	lea    -0xc(%ebp),%esp
 733:	5b                   	pop    %ebx
 734:	5e                   	pop    %esi
 735:	5f                   	pop    %edi
 736:	5d                   	pop    %ebp
 737:	c3                   	ret
 738:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 73f:	00 
  write(fd, &c, 1);
 740:	83 ec 04             	sub    $0x4,%esp
 743:	8d 55 e7             	lea    -0x19(%ebp),%edx
 746:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 74a:	6a 01                	push   $0x1
 74c:	52                   	push   %edx
 74d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 750:	57                   	push   %edi
 751:	e8 2d fe ff ff       	call   583 <write>
 756:	83 c4 0c             	add    $0xc,%esp
 759:	88 5d e7             	mov    %bl,-0x19(%ebp)
 75c:	6a 01                	push   $0x1
 75e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 761:	52                   	push   %edx
 762:	57                   	push   %edi
 763:	e8 1b fe ff ff       	call   583 <write>
        putc(fd, c);
 768:	83 c4 10             	add    $0x10,%esp
      state = 0;
 76b:	31 d2                	xor    %edx,%edx
 76d:	eb 8e                	jmp    6fd <printf+0x4d>
 76f:	90                   	nop
        printint(fd, *ap, 16, 0);
 770:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 773:	83 ec 0c             	sub    $0xc,%esp
 776:	b9 10 00 00 00       	mov    $0x10,%ecx
 77b:	8b 13                	mov    (%ebx),%edx
 77d:	6a 00                	push   $0x0
 77f:	89 f8                	mov    %edi,%eax
        ap++;
 781:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 784:	e8 87 fe ff ff       	call   610 <printint>
        ap++;
 789:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 78c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 78f:	31 d2                	xor    %edx,%edx
 791:	e9 67 ff ff ff       	jmp    6fd <printf+0x4d>
        s = (char*)*ap;
 796:	8b 45 d0             	mov    -0x30(%ebp),%eax
 799:	8b 18                	mov    (%eax),%ebx
        ap++;
 79b:	83 c0 04             	add    $0x4,%eax
 79e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7a1:	85 db                	test   %ebx,%ebx
 7a3:	0f 84 87 00 00 00    	je     830 <printf+0x180>
        while(*s != 0){
 7a9:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 7ac:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 7ae:	84 c0                	test   %al,%al
 7b0:	0f 84 47 ff ff ff    	je     6fd <printf+0x4d>
 7b6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 7b9:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7bc:	89 de                	mov    %ebx,%esi
 7be:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 7c0:	83 ec 04             	sub    $0x4,%esp
 7c3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 7c6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 7c9:	6a 01                	push   $0x1
 7cb:	53                   	push   %ebx
 7cc:	57                   	push   %edi
 7cd:	e8 b1 fd ff ff       	call   583 <write>
        while(*s != 0){
 7d2:	0f b6 06             	movzbl (%esi),%eax
 7d5:	83 c4 10             	add    $0x10,%esp
 7d8:	84 c0                	test   %al,%al
 7da:	75 e4                	jne    7c0 <printf+0x110>
      state = 0;
 7dc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 7df:	31 d2                	xor    %edx,%edx
 7e1:	e9 17 ff ff ff       	jmp    6fd <printf+0x4d>
        printint(fd, *ap, 10, 1);
 7e6:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 7e9:	83 ec 0c             	sub    $0xc,%esp
 7ec:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7f1:	8b 13                	mov    (%ebx),%edx
 7f3:	6a 01                	push   $0x1
 7f5:	eb 88                	jmp    77f <printf+0xcf>
        putc(fd, *ap);
 7f7:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 7fa:	83 ec 04             	sub    $0x4,%esp
 7fd:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 800:	8b 03                	mov    (%ebx),%eax
        ap++;
 802:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 805:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 808:	6a 01                	push   $0x1
 80a:	52                   	push   %edx
 80b:	57                   	push   %edi
 80c:	e8 72 fd ff ff       	call   583 <write>
        ap++;
 811:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 814:	83 c4 10             	add    $0x10,%esp
      state = 0;
 817:	31 d2                	xor    %edx,%edx
 819:	e9 df fe ff ff       	jmp    6fd <printf+0x4d>
 81e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 820:	83 ec 04             	sub    $0x4,%esp
 823:	88 5d e7             	mov    %bl,-0x19(%ebp)
 826:	8d 55 e7             	lea    -0x19(%ebp),%edx
 829:	6a 01                	push   $0x1
 82b:	e9 31 ff ff ff       	jmp    761 <printf+0xb1>
 830:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 835:	bb 18 0d 00 00       	mov    $0xd18,%ebx
 83a:	e9 77 ff ff ff       	jmp    7b6 <printf+0x106>
 83f:	90                   	nop

00000840 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 840:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 841:	a1 e0 11 00 00       	mov    0x11e0,%eax
{
 846:	89 e5                	mov    %esp,%ebp
 848:	57                   	push   %edi
 849:	56                   	push   %esi
 84a:	53                   	push   %ebx
 84b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 84e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 851:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 858:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 85a:	39 c8                	cmp    %ecx,%eax
 85c:	73 32                	jae    890 <free+0x50>
 85e:	39 d1                	cmp    %edx,%ecx
 860:	72 04                	jb     866 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 862:	39 d0                	cmp    %edx,%eax
 864:	72 32                	jb     898 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 866:	8b 73 fc             	mov    -0x4(%ebx),%esi
 869:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 86c:	39 fa                	cmp    %edi,%edx
 86e:	74 30                	je     8a0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 870:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 873:	8b 50 04             	mov    0x4(%eax),%edx
 876:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 879:	39 f1                	cmp    %esi,%ecx
 87b:	74 3a                	je     8b7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 87d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 87f:	5b                   	pop    %ebx
  freep = p;
 880:	a3 e0 11 00 00       	mov    %eax,0x11e0
}
 885:	5e                   	pop    %esi
 886:	5f                   	pop    %edi
 887:	5d                   	pop    %ebp
 888:	c3                   	ret
 889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 890:	39 d0                	cmp    %edx,%eax
 892:	72 04                	jb     898 <free+0x58>
 894:	39 d1                	cmp    %edx,%ecx
 896:	72 ce                	jb     866 <free+0x26>
{
 898:	89 d0                	mov    %edx,%eax
 89a:	eb bc                	jmp    858 <free+0x18>
 89c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 8a0:	03 72 04             	add    0x4(%edx),%esi
 8a3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8a6:	8b 10                	mov    (%eax),%edx
 8a8:	8b 12                	mov    (%edx),%edx
 8aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8ad:	8b 50 04             	mov    0x4(%eax),%edx
 8b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8b3:	39 f1                	cmp    %esi,%ecx
 8b5:	75 c6                	jne    87d <free+0x3d>
    p->s.size += bp->s.size;
 8b7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 8ba:	a3 e0 11 00 00       	mov    %eax,0x11e0
    p->s.size += bp->s.size;
 8bf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8c2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 8c5:	89 08                	mov    %ecx,(%eax)
}
 8c7:	5b                   	pop    %ebx
 8c8:	5e                   	pop    %esi
 8c9:	5f                   	pop    %edi
 8ca:	5d                   	pop    %ebp
 8cb:	c3                   	ret
 8cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	57                   	push   %edi
 8d4:	56                   	push   %esi
 8d5:	53                   	push   %ebx
 8d6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8dc:	8b 15 e0 11 00 00    	mov    0x11e0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e2:	8d 78 07             	lea    0x7(%eax),%edi
 8e5:	c1 ef 03             	shr    $0x3,%edi
 8e8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 8eb:	85 d2                	test   %edx,%edx
 8ed:	0f 84 8d 00 00 00    	je     980 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8f5:	8b 48 04             	mov    0x4(%eax),%ecx
 8f8:	39 f9                	cmp    %edi,%ecx
 8fa:	73 64                	jae    960 <malloc+0x90>
  if(nu < 4096)
 8fc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 901:	39 df                	cmp    %ebx,%edi
 903:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 906:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 90d:	eb 0a                	jmp    919 <malloc+0x49>
 90f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 910:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 912:	8b 48 04             	mov    0x4(%eax),%ecx
 915:	39 f9                	cmp    %edi,%ecx
 917:	73 47                	jae    960 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 919:	89 c2                	mov    %eax,%edx
 91b:	3b 05 e0 11 00 00    	cmp    0x11e0,%eax
 921:	75 ed                	jne    910 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 923:	83 ec 0c             	sub    $0xc,%esp
 926:	56                   	push   %esi
 927:	e8 bf fc ff ff       	call   5eb <sbrk>
  if(p == (char*)-1)
 92c:	83 c4 10             	add    $0x10,%esp
 92f:	83 f8 ff             	cmp    $0xffffffff,%eax
 932:	74 1c                	je     950 <malloc+0x80>
  hp->s.size = nu;
 934:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 937:	83 ec 0c             	sub    $0xc,%esp
 93a:	83 c0 08             	add    $0x8,%eax
 93d:	50                   	push   %eax
 93e:	e8 fd fe ff ff       	call   840 <free>
  return freep;
 943:	8b 15 e0 11 00 00    	mov    0x11e0,%edx
      if((p = morecore(nunits)) == 0)
 949:	83 c4 10             	add    $0x10,%esp
 94c:	85 d2                	test   %edx,%edx
 94e:	75 c0                	jne    910 <malloc+0x40>
        return 0;
  }
}
 950:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 953:	31 c0                	xor    %eax,%eax
}
 955:	5b                   	pop    %ebx
 956:	5e                   	pop    %esi
 957:	5f                   	pop    %edi
 958:	5d                   	pop    %ebp
 959:	c3                   	ret
 95a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 960:	39 cf                	cmp    %ecx,%edi
 962:	74 4c                	je     9b0 <malloc+0xe0>
        p->s.size -= nunits;
 964:	29 f9                	sub    %edi,%ecx
 966:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 969:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 96c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 96f:	89 15 e0 11 00 00    	mov    %edx,0x11e0
}
 975:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 978:	83 c0 08             	add    $0x8,%eax
}
 97b:	5b                   	pop    %ebx
 97c:	5e                   	pop    %esi
 97d:	5f                   	pop    %edi
 97e:	5d                   	pop    %ebp
 97f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 980:	c7 05 e0 11 00 00 e4 	movl   $0x11e4,0x11e0
 987:	11 00 00 
    base.s.size = 0;
 98a:	b8 e4 11 00 00       	mov    $0x11e4,%eax
    base.s.ptr = freep = prevp = &base;
 98f:	c7 05 e4 11 00 00 e4 	movl   $0x11e4,0x11e4
 996:	11 00 00 
    base.s.size = 0;
 999:	c7 05 e8 11 00 00 00 	movl   $0x0,0x11e8
 9a0:	00 00 00 
    if(p->s.size >= nunits){
 9a3:	e9 54 ff ff ff       	jmp    8fc <malloc+0x2c>
 9a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 9af:	00 
        prevp->s.ptr = p->s.ptr;
 9b0:	8b 08                	mov    (%eax),%ecx
 9b2:	89 0a                	mov    %ecx,(%edx)
 9b4:	eb b9                	jmp    96f <malloc+0x9f>
 9b6:	66 90                	xchg   %ax,%ax
 9b8:	66 90                	xchg   %ax,%ax
 9ba:	66 90                	xchg   %ax,%ax
 9bc:	66 90                	xchg   %ax,%ax
 9be:	66 90                	xchg   %ax,%ax

000009c0 <thread_init>:
void thread_init(void)
{
    int i;
    for(i = 0; i < MAX_THREADS; i++)
        table[i].state = TS_FREE;
    table[0].tid   = next_tid++;
 9c0:	a1 00 12 00 00       	mov    0x1200,%eax
        table[i].state = TS_FREE;
 9c5:	c7 05 30 22 00 00 00 	movl   $0x0,0x2230
 9cc:	00 00 00 
 9cf:	c7 05 3c 32 00 00 00 	movl   $0x0,0x323c
 9d6:	00 00 00 
    table[0].tid   = next_tid++;
 9d9:	8d 50 01             	lea    0x1(%eax),%edx
        table[i].state = TS_FREE;
 9dc:	c7 05 48 42 00 00 00 	movl   $0x0,0x4248
 9e3:	00 00 00 
 9e6:	c7 05 54 52 00 00 00 	movl   $0x0,0x5254
 9ed:	00 00 00 
 9f0:	c7 05 60 62 00 00 00 	movl   $0x0,0x6260
 9f7:	00 00 00 
 9fa:	c7 05 6c 72 00 00 00 	movl   $0x0,0x726c
 a01:	00 00 00 
 a04:	c7 05 78 82 00 00 00 	movl   $0x0,0x8278
 a0b:	00 00 00 
    table[0].tid   = next_tid++;
 a0e:	89 15 00 12 00 00    	mov    %edx,0x1200
 a14:	a3 20 12 00 00       	mov    %eax,0x1220
    table[0].state = TS_RUNNING;
 a19:	c7 05 24 12 00 00 02 	movl   $0x2,0x1224
 a20:	00 00 00 
    cur = 0;
 a23:	c7 05 04 12 00 00 00 	movl   $0x0,0x1204
 a2a:	00 00 00 
}
 a2d:	c3                   	ret
 a2e:	66 90                	xchg   %ax,%ax

00000a30 <thread_create>:

tid_t thread_create(void (*fn)(void*), void *arg)
{
    int i;
    for(i = 0; i < MAX_THREADS; i++)
 a30:	ba 24 12 00 00       	mov    $0x1224,%edx
 a35:	31 c0                	xor    %eax,%eax
 a37:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 a3e:	00 
 a3f:	90                   	nop
        if(table[i].state == TS_FREE) break;
 a40:	8b 0a                	mov    (%edx),%ecx
 a42:	85 c9                	test   %ecx,%ecx
 a44:	74 1a                	je     a60 <thread_create+0x30>
    for(i = 0; i < MAX_THREADS; i++)
 a46:	83 c0 01             	add    $0x1,%eax
 a49:	81 c2 0c 10 00 00    	add    $0x100c,%edx
 a4f:	83 f8 08             	cmp    $0x8,%eax
 a52:	75 ec                	jne    a40 <thread_create+0x10>

    table[i].saved_esp = sp;
    table[i].tid       = next_tid++;
    table[i].state     = TS_RUNNABLE;
    return table[i].tid;
}
 a54:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 a59:	c3                   	ret
 a5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
 a60:	55                   	push   %ebp
    uint *sp = (uint*)(table[i].stack + STACK_SIZE);
 a61:	69 c0 0c 10 00 00    	imul   $0x100c,%eax,%eax
{
 a67:	89 e5                	mov    %esp,%ebp
    *(--sp) = 0;                 /* edi  <- saved_esp here */
 a69:	8d 90 0c 22 00 00    	lea    0x220c(%eax),%edx
{
 a6f:	53                   	push   %ebx
    *(--sp) = (uint)arg;         /* arg for thread_stub    */
 a70:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    *(--sp) = 0;                 /* edi  <- saved_esp here */
 a73:	89 90 28 12 00 00    	mov    %edx,0x1228(%eax)
    table[i].tid       = next_tid++;
 a79:	8b 15 00 12 00 00    	mov    0x1200,%edx
    *(--sp) = 0xffffffff;        /* fake return address    */
 a7f:	c7 80 20 22 00 00 ff 	movl   $0xffffffff,0x2220(%eax)
 a86:	ff ff ff 
    *(--sp) = (uint)arg;         /* arg for thread_stub    */
 a89:	89 88 28 22 00 00    	mov    %ecx,0x2228(%eax)
    *(--sp) = (uint)fn;          /* fn for thread_stub     */
 a8f:	8b 4d 08             	mov    0x8(%ebp),%ecx
    table[i].tid       = next_tid++;
 a92:	8d 5a 01             	lea    0x1(%edx),%ebx
 a95:	89 90 20 12 00 00    	mov    %edx,0x1220(%eax)
    *(--sp) = (uint)fn;          /* fn for thread_stub     */
 a9b:	89 88 24 22 00 00    	mov    %ecx,0x2224(%eax)
    *(--sp) = (uint)thread_stub; /* eip: ret jumps here    */
 aa1:	c7 80 1c 22 00 00 80 	movl   $0xb80,0x221c(%eax)
 aa8:	0b 00 00 
    *(--sp) = 0;                 /* ebp                    */
 aab:	c7 80 18 22 00 00 00 	movl   $0x0,0x2218(%eax)
 ab2:	00 00 00 
    *(--sp) = 0;                 /* ebx                    */
 ab5:	c7 80 14 22 00 00 00 	movl   $0x0,0x2214(%eax)
 abc:	00 00 00 
    *(--sp) = 0;                 /* esi                    */
 abf:	c7 80 10 22 00 00 00 	movl   $0x0,0x2210(%eax)
 ac6:	00 00 00 
    *(--sp) = 0;                 /* edi  <- saved_esp here */
 ac9:	c7 80 0c 22 00 00 00 	movl   $0x0,0x220c(%eax)
 ad0:	00 00 00 
    table[i].tid       = next_tid++;
 ad3:	89 1d 00 12 00 00    	mov    %ebx,0x1200
}
 ad9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    table[i].state     = TS_RUNNABLE;
 adc:	c7 80 24 12 00 00 01 	movl   $0x1,0x1224(%eax)
 ae3:	00 00 00 
}
 ae6:	89 d0                	mov    %edx,%eax
 ae8:	c9                   	leave
 ae9:	c3                   	ret
 aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000af0 <thread_yield>:
    }
    return -1;
}

void thread_yield(void)
{
 af0:	55                   	push   %ebp
 af1:	89 e5                	mov    %esp,%ebp
 af3:	57                   	push   %edi
 af4:	56                   	push   %esi
 af5:	53                   	push   %ebx
 af6:	83 ec 0c             	sub    $0xc,%esp
    int old  = cur;
 af9:	8b 1d 04 12 00 00    	mov    0x1204,%ebx
    for(i = 1; i <= MAX_THREADS; i++){
 aff:	8d 53 01             	lea    0x1(%ebx),%edx
 b02:	8d 73 09             	lea    0x9(%ebx),%esi
 b05:	8d 76 00             	lea    0x0(%esi),%esi
        int idx = (cur + i) % MAX_THREADS;
 b08:	89 d1                	mov    %edx,%ecx
 b0a:	c1 f9 1f             	sar    $0x1f,%ecx
 b0d:	c1 e9 1d             	shr    $0x1d,%ecx
 b10:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
 b13:	83 e0 07             	and    $0x7,%eax
 b16:	29 c8                	sub    %ecx,%eax
        if(table[idx].state == TS_RUNNABLE)
 b18:	69 c8 0c 10 00 00    	imul   $0x100c,%eax,%ecx
 b1e:	83 b9 24 12 00 00 01 	cmpl   $0x1,0x1224(%ecx)
 b25:	8d b9 20 12 00 00    	lea    0x1220(%ecx),%edi
 b2b:	74 13                	je     b40 <thread_yield+0x50>
    for(i = 1; i <= MAX_THREADS; i++){
 b2d:	83 c2 01             	add    $0x1,%edx
 b30:	39 f2                	cmp    %esi,%edx
 b32:	75 d4                	jne    b08 <thread_yield+0x18>
    table[old].state  = TS_RUNNABLE;
    table[next].state = TS_RUNNING;
    cur = next;

    uswtch(&table[old].saved_esp, table[next].saved_esp);
}
 b34:	8d 65 f4             	lea    -0xc(%ebp),%esp
 b37:	5b                   	pop    %ebx
 b38:	5e                   	pop    %esi
 b39:	5f                   	pop    %edi
 b3a:	5d                   	pop    %ebp
 b3b:	c3                   	ret
 b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(next == -1) return;
 b40:	83 f8 ff             	cmp    $0xffffffff,%eax
 b43:	74 ef                	je     b34 <thread_yield+0x44>
    table[old].state  = TS_RUNNABLE;
 b45:	69 db 0c 10 00 00    	imul   $0x100c,%ebx,%ebx
    uswtch(&table[old].saved_esp, table[next].saved_esp);
 b4b:	83 ec 08             	sub    $0x8,%esp
    cur = next;
 b4e:	a3 04 12 00 00       	mov    %eax,0x1204
    table[old].state  = TS_RUNNABLE;
 b53:	c7 83 24 12 00 00 01 	movl   $0x1,0x1224(%ebx)
 b5a:	00 00 00 
    uswtch(&table[old].saved_esp, table[next].saved_esp);
 b5d:	81 c3 28 12 00 00    	add    $0x1228,%ebx
    table[next].state = TS_RUNNING;
 b63:	c7 47 04 02 00 00 00 	movl   $0x2,0x4(%edi)
    uswtch(&table[old].saved_esp, table[next].saved_esp);
 b6a:	ff 77 08             	push   0x8(%edi)
 b6d:	53                   	push   %ebx
 b6e:	e8 fb 00 00 00       	call   c6e <uswtch>
 b73:	83 c4 10             	add    $0x10,%esp
}
 b76:	8d 65 f4             	lea    -0xc(%ebp),%esp
 b79:	5b                   	pop    %ebx
 b7a:	5e                   	pop    %esi
 b7b:	5f                   	pop    %edi
 b7c:	5d                   	pop    %ebp
 b7d:	c3                   	ret
 b7e:	66 90                	xchg   %ax,%ax

00000b80 <thread_stub>:
{
 b80:	55                   	push   %ebp
 b81:	89 e5                	mov    %esp,%ebp
 b83:	83 ec 14             	sub    $0x14,%esp
    fn(arg);
 b86:	ff 75 0c             	push   0xc(%ebp)
 b89:	ff 55 08             	call   *0x8(%ebp)
    table[cur].state = TS_ZOMBIE;
 b8c:	69 05 04 12 00 00 0c 	imul   $0x100c,0x1204,%eax
 b93:	10 00 00 
 b96:	83 c4 10             	add    $0x10,%esp
 b99:	c7 80 24 12 00 00 03 	movl   $0x3,0x1224(%eax)
 ba0:	00 00 00 
 ba3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        thread_yield();
 ba8:	e8 43 ff ff ff       	call   af0 <thread_yield>
    while(1)
 bad:	eb f9                	jmp    ba8 <thread_stub+0x28>
 baf:	90                   	nop

00000bb0 <thread_join>:

int thread_join(tid_t tid)
{
 bb0:	55                   	push   %ebp
 bb1:	b8 20 12 00 00       	mov    $0x1220,%eax
 bb6:	89 e5                	mov    %esp,%ebp
 bb8:	56                   	push   %esi
 bb9:	8b 55 08             	mov    0x8(%ebp),%edx
 bbc:	53                   	push   %ebx
    int i;
    for(i = 0; i < MAX_THREADS; i++)
 bbd:	31 db                	xor    %ebx,%ebx
 bbf:	90                   	nop
        if(table[i].tid == tid) break;
 bc0:	39 10                	cmp    %edx,(%eax)
 bc2:	74 1c                	je     be0 <thread_join+0x30>
    for(i = 0; i < MAX_THREADS; i++)
 bc4:	83 c3 01             	add    $0x1,%ebx
 bc7:	05 0c 10 00 00       	add    $0x100c,%eax
 bcc:	83 fb 08             	cmp    $0x8,%ebx
 bcf:	75 ef                	jne    bc0 <thread_join+0x10>
    while(table[i].state != TS_ZOMBIE)
        thread_yield();

    table[i].state = TS_FREE;
    return 0;
 bd1:	5b                   	pop    %ebx
    if(i == MAX_THREADS) return -1;
 bd2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 bd7:	5e                   	pop    %esi
 bd8:	5d                   	pop    %ebp
 bd9:	c3                   	ret
 bda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    while(table[i].state != TS_ZOMBIE)
 be0:	69 c3 0c 10 00 00    	imul   $0x100c,%ebx,%eax
 be6:	83 b8 24 12 00 00 03 	cmpl   $0x3,0x1224(%eax)
 bed:	8d b0 20 12 00 00    	lea    0x1220(%eax),%esi
 bf3:	74 0e                	je     c03 <thread_join+0x53>
 bf5:	8d 76 00             	lea    0x0(%esi),%esi
        thread_yield();
 bf8:	e8 f3 fe ff ff       	call   af0 <thread_yield>
    while(table[i].state != TS_ZOMBIE)
 bfd:	83 7e 04 03          	cmpl   $0x3,0x4(%esi)
 c01:	75 f5                	jne    bf8 <thread_join+0x48>
    table[i].state = TS_FREE;
 c03:	69 db 0c 10 00 00    	imul   $0x100c,%ebx,%ebx
    return 0;
 c09:	31 c0                	xor    %eax,%eax
    table[i].state = TS_FREE;
 c0b:	c7 83 24 12 00 00 00 	movl   $0x0,0x1224(%ebx)
 c12:	00 00 00 
 c15:	5b                   	pop    %ebx
 c16:	5e                   	pop    %esi
 c17:	5d                   	pop    %ebp
 c18:	c3                   	ret
 c19:	66 90                	xchg   %ax,%ax
 c1b:	66 90                	xchg   %ax,%ax
 c1d:	66 90                	xchg   %ax,%ax
 c1f:	90                   	nop

00000c20 <mutex_init>:
#include "stat.h"
#include "user.h"
#include "uthread.h"
#include "umutex.h"

void mutex_init(umutex_t *m)   { m->locked = 0; }
 c20:	55                   	push   %ebp
 c21:	89 e5                	mov    %esp,%ebp
 c23:	8b 45 08             	mov    0x8(%ebp),%eax
 c26:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 c2c:	5d                   	pop    %ebp
 c2d:	c3                   	ret
 c2e:	66 90                	xchg   %ax,%ax

00000c30 <mutex_lock>:
void mutex_lock(umutex_t *m)   { while (m->locked) thread_yield(); m->locked = 1; }
 c30:	55                   	push   %ebp
 c31:	89 e5                	mov    %esp,%ebp
 c33:	53                   	push   %ebx
 c34:	83 ec 04             	sub    $0x4,%esp
 c37:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c3a:	8b 03                	mov    (%ebx),%eax
 c3c:	85 c0                	test   %eax,%eax
 c3e:	74 0b                	je     c4b <mutex_lock+0x1b>
 c40:	e8 ab fe ff ff       	call   af0 <thread_yield>
 c45:	8b 03                	mov    (%ebx),%eax
 c47:	85 c0                	test   %eax,%eax
 c49:	75 f5                	jne    c40 <mutex_lock+0x10>
 c4b:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
 c51:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 c54:	c9                   	leave
 c55:	c3                   	ret
 c56:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 c5d:	00 
 c5e:	66 90                	xchg   %ax,%ax

00000c60 <mutex_unlock>:
 c60:	55                   	push   %ebp
 c61:	89 e5                	mov    %esp,%ebp
 c63:	8b 45 08             	mov    0x8(%ebp),%eax
 c66:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 c6c:	5d                   	pop    %ebp
 c6d:	c3                   	ret

00000c6e <uswtch>:
.globl uswtch
.type  uswtch, @function
uswtch:
    # args: old_esp_ptr at esp+4, new_esp at esp+8
    # (after 4 pushes below: old_esp_ptr at esp+20, new_esp at esp+24)
    pushl %ebp
 c6e:	55                   	push   %ebp
    pushl %ebx
 c6f:	53                   	push   %ebx
    pushl %esi
 c70:	56                   	push   %esi
    pushl %edi
 c71:	57                   	push   %edi

    movl  20(%esp), %eax
 c72:	8b 44 24 14          	mov    0x14(%esp),%eax
    movl  %esp, (%eax)
 c76:	89 20                	mov    %esp,(%eax)

    movl  24(%esp), %esp
 c78:	8b 64 24 18          	mov    0x18(%esp),%esp

    popl %edi
 c7c:	5f                   	pop    %edi
    popl %esi
 c7d:	5e                   	pop    %esi
    popl %ebx
 c7e:	5b                   	pop    %ebx
    popl %ebp
 c7f:	5d                   	pop    %ebp
 c80:	c3                   	ret
