
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	31 ff                	xor    %edi,%edi
   6:	56                   	push   %esi
   7:	31 f6                	xor    %esi,%esi
   9:	53                   	push   %ebx
   a:	83 ec 3c             	sub    $0x3c,%esp
   d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  14:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  1b:	90                   	nop
  1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  20:	8b 45 08             	mov    0x8(%ebp),%eax
  23:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  2a:	00 
  2b:	c7 44 24 04 e0 08 00 	movl   $0x8e0,0x4(%esp)
  32:	00 
  33:	89 04 24             	mov    %eax,(%esp)
  36:	e8 b5 03 00 00       	call   3f0 <read>
  3b:	83 f8 00             	cmp    $0x0,%eax
  3e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  41:	7e 4f                	jle    92 <wc+0x92>
  43:	31 db                	xor    %ebx,%ebx
  45:	eb 0b                	jmp    52 <wc+0x52>
  47:	90                   	nop
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
  48:	31 ff                	xor    %edi,%edi
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  4a:	83 c3 01             	add    $0x1,%ebx
  4d:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
  50:	7e 38                	jle    8a <wc+0x8a>
      c++;
      if(buf[i] == '\n')
  52:	0f be 83 e0 08 00 00 	movsbl 0x8e0(%ebx),%eax
        l++;
  59:	31 d2                	xor    %edx,%edx
      if(strchr(" \r\t\n\v", buf[i]))
  5b:	c7 04 24 6e 08 00 00 	movl   $0x86e,(%esp)
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
  62:	3c 0a                	cmp    $0xa,%al
  64:	0f 94 c2             	sete   %dl
  67:	01 d6                	add    %edx,%esi
      if(strchr(" \r\t\n\v", buf[i]))
  69:	89 44 24 04          	mov    %eax,0x4(%esp)
  6d:	e8 fe 01 00 00       	call   270 <strchr>
  72:	85 c0                	test   %eax,%eax
  74:	75 d2                	jne    48 <wc+0x48>
        inword = 0;
      else if(!inword){
  76:	85 ff                	test   %edi,%edi
  78:	75 d0                	jne    4a <wc+0x4a>
        w++;
  7a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  7e:	83 c3 01             	add    $0x1,%ebx
  81:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
      else if(!inword){
        w++;
  84:	66 bf 01 00          	mov    $0x1,%di
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  88:	7f c8                	jg     52 <wc+0x52>
  8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  8d:	01 45 dc             	add    %eax,-0x24(%ebp)
  90:	eb 8e                	jmp    20 <wc+0x20>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
  92:	75 35                	jne    c9 <wc+0xc9>
    printf(1, "wc: read error\n");
    exit();
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  94:	8b 45 0c             	mov    0xc(%ebp),%eax
  97:	89 74 24 08          	mov    %esi,0x8(%esp)
  9b:	c7 44 24 04 84 08 00 	movl   $0x884,0x4(%esp)
  a2:	00 
  a3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  aa:	89 44 24 14          	mov    %eax,0x14(%esp)
  ae:	8b 45 dc             	mov    -0x24(%ebp),%eax
  b1:	89 44 24 10          	mov    %eax,0x10(%esp)
  b5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  b8:	89 44 24 0c          	mov    %eax,0xc(%esp)
  bc:	e8 9f 04 00 00       	call   560 <printf>
}
  c1:	83 c4 3c             	add    $0x3c,%esp
  c4:	5b                   	pop    %ebx
  c5:	5e                   	pop    %esi
  c6:	5f                   	pop    %edi
  c7:	5d                   	pop    %ebp
  c8:	c3                   	ret    
        inword = 1;
      }
    }
  }
  if(n < 0){
    printf(1, "wc: read error\n");
  c9:	c7 44 24 04 74 08 00 	movl   $0x874,0x4(%esp)
  d0:	00 
  d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d8:	e8 83 04 00 00       	call   560 <printf>
    exit();
  dd:	e8 f6 02 00 00       	call   3d8 <exit>
  e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000f0 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	83 e4 f0             	and    $0xfffffff0,%esp
  f6:	57                   	push   %edi
  f7:	56                   	push   %esi
  f8:	53                   	push   %ebx
  f9:	83 ec 24             	sub    $0x24,%esp
  fc:	8b 7d 08             	mov    0x8(%ebp),%edi
  int fd, i;

  if(argc <= 1){
  ff:	83 ff 01             	cmp    $0x1,%edi
 102:	7e 74                	jle    178 <main+0x88>
    wc(0, "");
    exit();
 104:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 107:	be 01 00 00 00       	mov    $0x1,%esi
 10c:	83 c3 04             	add    $0x4,%ebx
 10f:	90                   	nop
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
 110:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 117:	00 
 118:	8b 03                	mov    (%ebx),%eax
 11a:	89 04 24             	mov    %eax,(%esp)
 11d:	e8 f6 02 00 00       	call   418 <open>
 122:	85 c0                	test   %eax,%eax
 124:	78 32                	js     158 <main+0x68>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
 126:	8b 13                	mov    (%ebx),%edx
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
 128:	83 c6 01             	add    $0x1,%esi
 12b:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
 12e:	89 04 24             	mov    %eax,(%esp)
 131:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 135:	89 54 24 04          	mov    %edx,0x4(%esp)
 139:	e8 c2 fe ff ff       	call   0 <wc>
    close(fd);
 13e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 142:	89 04 24             	mov    %eax,(%esp)
 145:	e8 b6 02 00 00       	call   400 <close>
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
 14a:	39 f7                	cmp    %esi,%edi
 14c:	7f c2                	jg     110 <main+0x20>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
 14e:	e8 85 02 00 00       	call   3d8 <exit>
 153:	90                   	nop
 154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
 158:	8b 03                	mov    (%ebx),%eax
 15a:	c7 44 24 04 91 08 00 	movl   $0x891,0x4(%esp)
 161:	00 
 162:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 169:	89 44 24 08          	mov    %eax,0x8(%esp)
 16d:	e8 ee 03 00 00       	call   560 <printf>
      exit();
 172:	e8 61 02 00 00       	call   3d8 <exit>
 177:	90                   	nop
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    wc(0, "");
 178:	c7 44 24 04 83 08 00 	movl   $0x883,0x4(%esp)
 17f:	00 
 180:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 187:	e8 74 fe ff ff       	call   0 <wc>
    exit();
 18c:	e8 47 02 00 00       	call   3d8 <exit>
 191:	90                   	nop
 192:	90                   	nop
 193:	90                   	nop
 194:	90                   	nop
 195:	90                   	nop
 196:	90                   	nop
 197:	90                   	nop
 198:	90                   	nop
 199:	90                   	nop
 19a:	90                   	nop
 19b:	90                   	nop
 19c:	90                   	nop
 19d:	90                   	nop
 19e:	90                   	nop
 19f:	90                   	nop

000001a0 <strcpy>:
#include "fcntl.h"
#include "user.h"

char*
strcpy(char *s, char *t)
{
 1a0:	55                   	push   %ebp
 1a1:	31 d2                	xor    %edx,%edx
 1a3:	89 e5                	mov    %esp,%ebp
 1a5:	8b 45 08             	mov    0x8(%ebp),%eax
 1a8:	53                   	push   %ebx
 1a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1b0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 1b4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 1b7:	83 c2 01             	add    $0x1,%edx
 1ba:	84 c9                	test   %cl,%cl
 1bc:	75 f2                	jne    1b0 <strcpy+0x10>
    ;
  return os;
}
 1be:	5b                   	pop    %ebx
 1bf:	5d                   	pop    %ebp
 1c0:	c3                   	ret    
 1c1:	eb 0d                	jmp    1d0 <strcmp>
 1c3:	90                   	nop
 1c4:	90                   	nop
 1c5:	90                   	nop
 1c6:	90                   	nop
 1c7:	90                   	nop
 1c8:	90                   	nop
 1c9:	90                   	nop
 1ca:	90                   	nop
 1cb:	90                   	nop
 1cc:	90                   	nop
 1cd:	90                   	nop
 1ce:	90                   	nop
 1cf:	90                   	nop

000001d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	53                   	push   %ebx
 1d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1d7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1da:	0f b6 01             	movzbl (%ecx),%eax
 1dd:	84 c0                	test   %al,%al
 1df:	75 14                	jne    1f5 <strcmp+0x25>
 1e1:	eb 25                	jmp    208 <strcmp+0x38>
 1e3:	90                   	nop
 1e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
 1e8:	83 c1 01             	add    $0x1,%ecx
 1eb:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1ee:	0f b6 01             	movzbl (%ecx),%eax
 1f1:	84 c0                	test   %al,%al
 1f3:	74 13                	je     208 <strcmp+0x38>
 1f5:	0f b6 1a             	movzbl (%edx),%ebx
 1f8:	38 d8                	cmp    %bl,%al
 1fa:	74 ec                	je     1e8 <strcmp+0x18>
 1fc:	0f b6 db             	movzbl %bl,%ebx
 1ff:	0f b6 c0             	movzbl %al,%eax
 202:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 204:	5b                   	pop    %ebx
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    
 207:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 208:	0f b6 1a             	movzbl (%edx),%ebx
 20b:	31 c0                	xor    %eax,%eax
 20d:	0f b6 db             	movzbl %bl,%ebx
 210:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 212:	5b                   	pop    %ebx
 213:	5d                   	pop    %ebp
 214:	c3                   	ret    
 215:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <strlen>:

uint
strlen(char *s)
{
 220:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 221:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 223:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
 225:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 227:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 22a:	80 39 00             	cmpb   $0x0,(%ecx)
 22d:	74 0c                	je     23b <strlen+0x1b>
 22f:	90                   	nop
 230:	83 c2 01             	add    $0x1,%edx
 233:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 237:	89 d0                	mov    %edx,%eax
 239:	75 f5                	jne    230 <strlen+0x10>
    ;
  return n;
}
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
 23d:	8d 76 00             	lea    0x0(%esi),%esi

00000240 <memset>:

void*
memset(void *dst, int c, uint n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 4d 10             	mov    0x10(%ebp),%ecx
 246:	53                   	push   %ebx
 247:	8b 45 08             	mov    0x8(%ebp),%eax
  char *d;
  
  d = dst;
  while(n-- > 0)
 24a:	85 c9                	test   %ecx,%ecx
 24c:	74 14                	je     262 <memset+0x22>
 24e:	0f b6 5d 0c          	movzbl 0xc(%ebp),%ebx
 252:	31 d2                	xor    %edx,%edx
 254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *d++ = c;
 258:	88 1c 10             	mov    %bl,(%eax,%edx,1)
 25b:	83 c2 01             	add    $0x1,%edx
memset(void *dst, int c, uint n)
{
  char *d;
  
  d = dst;
  while(n-- > 0)
 25e:	39 ca                	cmp    %ecx,%edx
 260:	75 f6                	jne    258 <memset+0x18>
    *d++ = c;
  return dst;
}
 262:	5b                   	pop    %ebx
 263:	5d                   	pop    %ebp
 264:	c3                   	ret    
 265:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <strchr>:

char*
strchr(const char *s, char c)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 45 08             	mov    0x8(%ebp),%eax
 276:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 27a:	0f b6 10             	movzbl (%eax),%edx
 27d:	84 d2                	test   %dl,%dl
 27f:	75 11                	jne    292 <strchr+0x22>
 281:	eb 15                	jmp    298 <strchr+0x28>
 283:	90                   	nop
 284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 288:	83 c0 01             	add    $0x1,%eax
 28b:	0f b6 10             	movzbl (%eax),%edx
 28e:	84 d2                	test   %dl,%dl
 290:	74 06                	je     298 <strchr+0x28>
    if(*s == c)
 292:	38 ca                	cmp    %cl,%dl
 294:	75 f2                	jne    288 <strchr+0x18>
      return (char*) s;
  return 0;
}
 296:	5d                   	pop    %ebp
 297:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 298:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*) s;
  return 0;
}
 29a:	5d                   	pop    %ebp
 29b:	90                   	nop
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2a0:	c3                   	ret    
 2a1:	eb 0d                	jmp    2b0 <atoi>
 2a3:	90                   	nop
 2a4:	90                   	nop
 2a5:	90                   	nop
 2a6:	90                   	nop
 2a7:	90                   	nop
 2a8:	90                   	nop
 2a9:	90                   	nop
 2aa:	90                   	nop
 2ab:	90                   	nop
 2ac:	90                   	nop
 2ad:	90                   	nop
 2ae:	90                   	nop
 2af:	90                   	nop

000002b0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 2b0:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2b1:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 2b3:	89 e5                	mov    %esp,%ebp
 2b5:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2b8:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2b9:	0f b6 11             	movzbl (%ecx),%edx
 2bc:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2bf:	80 fb 09             	cmp    $0x9,%bl
 2c2:	77 1c                	ja     2e0 <atoi+0x30>
 2c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 2c8:	0f be d2             	movsbl %dl,%edx
 2cb:	83 c1 01             	add    $0x1,%ecx
 2ce:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2d1:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2d5:	0f b6 11             	movzbl (%ecx),%edx
 2d8:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2db:	80 fb 09             	cmp    $0x9,%bl
 2de:	76 e8                	jbe    2c8 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 2e0:	5b                   	pop    %ebx
 2e1:	5d                   	pop    %ebp
 2e2:	c3                   	ret    
 2e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002f0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	56                   	push   %esi
 2f4:	8b 45 08             	mov    0x8(%ebp),%eax
 2f7:	53                   	push   %ebx
 2f8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2fe:	85 db                	test   %ebx,%ebx
 300:	7e 14                	jle    316 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 302:	31 d2                	xor    %edx,%edx
 304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 308:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 30c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 30f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 312:	39 da                	cmp    %ebx,%edx
 314:	75 f2                	jne    308 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 316:	5b                   	pop    %ebx
 317:	5e                   	pop    %esi
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    
 31a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000320 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 326:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 329:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 32c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 32f:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 334:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 33b:	00 
 33c:	89 04 24             	mov    %eax,(%esp)
 33f:	e8 d4 00 00 00       	call   418 <open>
  if(fd < 0)
 344:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 346:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 348:	78 19                	js     363 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 34a:	8b 45 0c             	mov    0xc(%ebp),%eax
 34d:	89 1c 24             	mov    %ebx,(%esp)
 350:	89 44 24 04          	mov    %eax,0x4(%esp)
 354:	e8 d7 00 00 00       	call   430 <fstat>
  close(fd);
 359:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 35c:	89 c6                	mov    %eax,%esi
  close(fd);
 35e:	e8 9d 00 00 00       	call   400 <close>
  return r;
}
 363:	89 f0                	mov    %esi,%eax
 365:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 368:	8b 75 fc             	mov    -0x4(%ebp),%esi
 36b:	89 ec                	mov    %ebp,%esp
 36d:	5d                   	pop    %ebp
 36e:	c3                   	ret    
 36f:	90                   	nop

00000370 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
 375:	31 f6                	xor    %esi,%esi
 377:	53                   	push   %ebx
 378:	83 ec 2c             	sub    $0x2c,%esp
 37b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 37e:	eb 06                	jmp    386 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 380:	3c 0a                	cmp    $0xa,%al
 382:	74 39                	je     3bd <gets+0x4d>
 384:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 386:	8d 5e 01             	lea    0x1(%esi),%ebx
 389:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 38c:	7d 31                	jge    3bf <gets+0x4f>
    cc = read(0, &c, 1);
 38e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 391:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 398:	00 
 399:	89 44 24 04          	mov    %eax,0x4(%esp)
 39d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3a4:	e8 47 00 00 00       	call   3f0 <read>
    if(cc < 1)
 3a9:	85 c0                	test   %eax,%eax
 3ab:	7e 12                	jle    3bf <gets+0x4f>
      break;
    buf[i++] = c;
 3ad:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3b1:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 3b5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3b9:	3c 0d                	cmp    $0xd,%al
 3bb:	75 c3                	jne    380 <gets+0x10>
 3bd:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3bf:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3c3:	89 f8                	mov    %edi,%eax
 3c5:	83 c4 2c             	add    $0x2c,%esp
 3c8:	5b                   	pop    %ebx
 3c9:	5e                   	pop    %esi
 3ca:	5f                   	pop    %edi
 3cb:	5d                   	pop    %ebp
 3cc:	c3                   	ret    
 3cd:	90                   	nop
 3ce:	90                   	nop
 3cf:	90                   	nop

000003d0 <fork>:
 3d0:	b8 01 00 00 00       	mov    $0x1,%eax
 3d5:	cd 30                	int    $0x30
 3d7:	c3                   	ret    

000003d8 <exit>:
 3d8:	b8 02 00 00 00       	mov    $0x2,%eax
 3dd:	cd 30                	int    $0x30
 3df:	c3                   	ret    

000003e0 <wait>:
 3e0:	b8 03 00 00 00       	mov    $0x3,%eax
 3e5:	cd 30                	int    $0x30
 3e7:	c3                   	ret    

000003e8 <pipe>:
 3e8:	b8 04 00 00 00       	mov    $0x4,%eax
 3ed:	cd 30                	int    $0x30
 3ef:	c3                   	ret    

000003f0 <read>:
 3f0:	b8 06 00 00 00       	mov    $0x6,%eax
 3f5:	cd 30                	int    $0x30
 3f7:	c3                   	ret    

000003f8 <write>:
 3f8:	b8 05 00 00 00       	mov    $0x5,%eax
 3fd:	cd 30                	int    $0x30
 3ff:	c3                   	ret    

00000400 <close>:
 400:	b8 07 00 00 00       	mov    $0x7,%eax
 405:	cd 30                	int    $0x30
 407:	c3                   	ret    

00000408 <kill>:
 408:	b8 08 00 00 00       	mov    $0x8,%eax
 40d:	cd 30                	int    $0x30
 40f:	c3                   	ret    

00000410 <exec>:
 410:	b8 09 00 00 00       	mov    $0x9,%eax
 415:	cd 30                	int    $0x30
 417:	c3                   	ret    

00000418 <open>:
 418:	b8 0a 00 00 00       	mov    $0xa,%eax
 41d:	cd 30                	int    $0x30
 41f:	c3                   	ret    

00000420 <mknod>:
 420:	b8 0b 00 00 00       	mov    $0xb,%eax
 425:	cd 30                	int    $0x30
 427:	c3                   	ret    

00000428 <unlink>:
 428:	b8 0c 00 00 00       	mov    $0xc,%eax
 42d:	cd 30                	int    $0x30
 42f:	c3                   	ret    

00000430 <fstat>:
 430:	b8 0d 00 00 00       	mov    $0xd,%eax
 435:	cd 30                	int    $0x30
 437:	c3                   	ret    

00000438 <link>:
 438:	b8 0e 00 00 00       	mov    $0xe,%eax
 43d:	cd 30                	int    $0x30
 43f:	c3                   	ret    

00000440 <mkdir>:
 440:	b8 0f 00 00 00       	mov    $0xf,%eax
 445:	cd 30                	int    $0x30
 447:	c3                   	ret    

00000448 <chdir>:
 448:	b8 10 00 00 00       	mov    $0x10,%eax
 44d:	cd 30                	int    $0x30
 44f:	c3                   	ret    

00000450 <dup>:
 450:	b8 11 00 00 00       	mov    $0x11,%eax
 455:	cd 30                	int    $0x30
 457:	c3                   	ret    

00000458 <getpid>:
 458:	b8 12 00 00 00       	mov    $0x12,%eax
 45d:	cd 30                	int    $0x30
 45f:	c3                   	ret    

00000460 <sbrk>:
 460:	b8 13 00 00 00       	mov    $0x13,%eax
 465:	cd 30                	int    $0x30
 467:	c3                   	ret    

00000468 <sleep>:
 468:	b8 14 00 00 00       	mov    $0x14,%eax
 46d:	cd 30                	int    $0x30
 46f:	c3                   	ret    

00000470 <tick>:
 470:	b8 15 00 00 00       	mov    $0x15,%eax
 475:	cd 30                	int    $0x30
 477:	c3                   	ret    

00000478 <fork_tickets>:
 478:	b8 16 00 00 00       	mov    $0x16,%eax
 47d:	cd 30                	int    $0x30
 47f:	c3                   	ret    

00000480 <fork_thread>:
 480:	b8 19 00 00 00       	mov    $0x19,%eax
 485:	cd 30                	int    $0x30
 487:	c3                   	ret    

00000488 <wait_thread>:
 488:	b8 1a 00 00 00       	mov    $0x1a,%eax
 48d:	cd 30                	int    $0x30
 48f:	c3                   	ret    

00000490 <sleep_lock>:
 490:	b8 17 00 00 00       	mov    $0x17,%eax
 495:	cd 30                	int    $0x30
 497:	c3                   	ret    

00000498 <wake_lock>:
 498:	b8 18 00 00 00       	mov    $0x18,%eax
 49d:	cd 30                	int    $0x30
 49f:	c3                   	ret    

000004a0 <putc>:

//struct mutex_t plock;

static void
putc(int fd, char c)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	83 ec 28             	sub    $0x28,%esp
 4a6:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4a9:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4ac:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4b3:	00 
 4b4:	89 54 24 04          	mov    %edx,0x4(%esp)
 4b8:	89 04 24             	mov    %eax,(%esp)
 4bb:	e8 38 ff ff ff       	call   3f8 <write>
}
 4c0:	c9                   	leave  
 4c1:	c3                   	ret    
 4c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004d0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	89 c7                	mov    %eax,%edi
 4d6:	56                   	push   %esi
 4d7:	89 ce                	mov    %ecx,%esi
 4d9:	53                   	push   %ebx
 4da:	83 ec 2c             	sub    $0x2c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4dd:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4e0:	85 c9                	test   %ecx,%ecx
 4e2:	74 04                	je     4e8 <printint+0x18>
 4e4:	85 d2                	test   %edx,%edx
 4e6:	78 5d                	js     545 <printint+0x75>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4e8:	89 d0                	mov    %edx,%eax
 4ea:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4f1:	31 c9                	xor    %ecx,%ecx
 4f3:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 4f6:	66 90                	xchg   %ax,%ax
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 4f8:	31 d2                	xor    %edx,%edx
 4fa:	f7 f6                	div    %esi
 4fc:	0f b6 92 ad 08 00 00 	movzbl 0x8ad(%edx),%edx
 503:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 506:	83 c1 01             	add    $0x1,%ecx
  }while((x /= base) != 0);
 509:	85 c0                	test   %eax,%eax
 50b:	75 eb                	jne    4f8 <printint+0x28>
  if(neg)
 50d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 510:	85 c0                	test   %eax,%eax
 512:	74 08                	je     51c <printint+0x4c>
    buf[i++] = '-';
 514:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 519:	83 c1 01             	add    $0x1,%ecx

  while(--i >= 0)
 51c:	8d 71 ff             	lea    -0x1(%ecx),%esi
 51f:	01 f3                	add    %esi,%ebx
 521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 528:	0f be 13             	movsbl (%ebx),%edx
 52b:	89 f8                	mov    %edi,%eax
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 52d:	83 ee 01             	sub    $0x1,%esi
 530:	83 eb 01             	sub    $0x1,%ebx
    putc(fd, buf[i]);
 533:	e8 68 ff ff ff       	call   4a0 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 538:	83 fe ff             	cmp    $0xffffffff,%esi
 53b:	75 eb                	jne    528 <printint+0x58>
    putc(fd, buf[i]);
}
 53d:	83 c4 2c             	add    $0x2c,%esp
 540:	5b                   	pop    %ebx
 541:	5e                   	pop    %esi
 542:	5f                   	pop    %edi
 543:	5d                   	pop    %ebp
 544:	c3                   	ret    
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 545:	89 d0                	mov    %edx,%eax
 547:	f7 d8                	neg    %eax
 549:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
 550:	eb 9f                	jmp    4f1 <printint+0x21>
 552:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000560 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
 566:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 569:	8b 45 0c             	mov    0xc(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 56c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 56f:	0f b6 08             	movzbl (%eax),%ecx
 572:	84 c9                	test   %cl,%cl
 574:	0f 84 96 00 00 00    	je     610 <printf+0xb0>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 57a:	8d 55 10             	lea    0x10(%ebp),%edx
 57d:	31 f6                	xor    %esi,%esi
 57f:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 582:	31 db                	xor    %ebx,%ebx
 584:	eb 1a                	jmp    5a0 <printf+0x40>
 586:	66 90                	xchg   %ax,%ax
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 588:	83 f9 25             	cmp    $0x25,%ecx
 58b:	0f 85 87 00 00 00    	jne    618 <printf+0xb8>
 591:	66 be 25 00          	mov    $0x25,%si
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 595:	83 c3 01             	add    $0x1,%ebx
 598:	0f b6 0c 18          	movzbl (%eax,%ebx,1),%ecx
 59c:	84 c9                	test   %cl,%cl
 59e:	74 70                	je     610 <printf+0xb0>
    c = fmt[i] & 0xff;
    if(state == 0){
 5a0:	85 f6                	test   %esi,%esi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 5a2:	0f b6 c9             	movzbl %cl,%ecx
    if(state == 0){
 5a5:	74 e1                	je     588 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5a7:	83 fe 25             	cmp    $0x25,%esi
 5aa:	75 e9                	jne    595 <printf+0x35>
      if(c == 'd'){
 5ac:	83 f9 64             	cmp    $0x64,%ecx
 5af:	90                   	nop
 5b0:	0f 84 fa 00 00 00    	je     6b0 <printf+0x150>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5b6:	83 f9 70             	cmp    $0x70,%ecx
 5b9:	74 75                	je     630 <printf+0xd0>
 5bb:	83 f9 78             	cmp    $0x78,%ecx
 5be:	66 90                	xchg   %ax,%ax
 5c0:	74 6e                	je     630 <printf+0xd0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5c2:	83 f9 73             	cmp    $0x73,%ecx
 5c5:	0f 84 8d 00 00 00    	je     658 <printf+0xf8>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5cb:	83 f9 63             	cmp    $0x63,%ecx
 5ce:	66 90                	xchg   %ax,%ax
 5d0:	0f 84 fe 00 00 00    	je     6d4 <printf+0x174>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5d6:	83 f9 25             	cmp    $0x25,%ecx
 5d9:	0f 84 b9 00 00 00    	je     698 <printf+0x138>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5df:	ba 25 00 00 00       	mov    $0x25,%edx
 5e4:	89 f8                	mov    %edi,%eax
 5e6:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5e9:	83 c3 01             	add    $0x1,%ebx
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 5ec:	31 f6                	xor    %esi,%esi
        ap++;
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5ee:	e8 ad fe ff ff       	call   4a0 <putc>
        putc(fd, c);
 5f3:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 5f6:	89 f8                	mov    %edi,%eax
 5f8:	0f be d1             	movsbl %cl,%edx
 5fb:	e8 a0 fe ff ff       	call   4a0 <putc>
 600:	8b 45 0c             	mov    0xc(%ebp),%eax
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 603:	0f b6 0c 18          	movzbl (%eax,%ebx,1),%ecx
 607:	84 c9                	test   %cl,%cl
 609:	75 95                	jne    5a0 <printf+0x40>
 60b:	90                   	nop
 60c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      }
      state = 0;
    }
  }
  //mutex_unlock(&plock);
}
 610:	83 c4 2c             	add    $0x2c,%esp
 613:	5b                   	pop    %ebx
 614:	5e                   	pop    %esi
 615:	5f                   	pop    %edi
 616:	5d                   	pop    %ebp
 617:	c3                   	ret    
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 618:	89 f8                	mov    %edi,%eax
 61a:	0f be d1             	movsbl %cl,%edx
 61d:	e8 7e fe ff ff       	call   4a0 <putc>
 622:	8b 45 0c             	mov    0xc(%ebp),%eax
 625:	e9 6b ff ff ff       	jmp    595 <printf+0x35>
 62a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 630:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 633:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
 638:	31 f6                	xor    %esi,%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 63a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 641:	8b 10                	mov    (%eax),%edx
 643:	89 f8                	mov    %edi,%eax
 645:	e8 86 fe ff ff       	call   4d0 <printint>
 64a:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 64d:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 651:	e9 3f ff ff ff       	jmp    595 <printf+0x35>
 656:	66 90                	xchg   %ax,%ax
      } else if(c == 's'){
        s = (char*)*ap;
 658:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 65b:	8b 32                	mov    (%edx),%esi
        ap++;
 65d:	83 c2 04             	add    $0x4,%edx
 660:	89 55 e4             	mov    %edx,-0x1c(%ebp)
        if(s == 0)
 663:	85 f6                	test   %esi,%esi
 665:	0f 84 84 00 00 00    	je     6ef <printf+0x18f>
          s = "(null)";
        while(*s != 0){
 66b:	0f b6 16             	movzbl (%esi),%edx
 66e:	84 d2                	test   %dl,%dl
 670:	74 1d                	je     68f <printf+0x12f>
 672:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
          putc(fd, *s);
 678:	0f be d2             	movsbl %dl,%edx
          s++;
 67b:	83 c6 01             	add    $0x1,%esi
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
 67e:	89 f8                	mov    %edi,%eax
 680:	e8 1b fe ff ff       	call   4a0 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 685:	0f b6 16             	movzbl (%esi),%edx
 688:	84 d2                	test   %dl,%dl
 68a:	75 ec                	jne    678 <printf+0x118>
 68c:	8b 45 0c             	mov    0xc(%ebp),%eax
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 68f:	31 f6                	xor    %esi,%esi
 691:	e9 ff fe ff ff       	jmp    595 <printf+0x35>
 696:	66 90                	xchg   %ax,%ax
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
        putc(fd, c);
 698:	89 f8                	mov    %edi,%eax
 69a:	ba 25 00 00 00       	mov    $0x25,%edx
 69f:	e8 fc fd ff ff       	call   4a0 <putc>
 6a4:	31 f6                	xor    %esi,%esi
 6a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 6a9:	e9 e7 fe ff ff       	jmp    595 <printf+0x35>
 6ae:	66 90                	xchg   %ax,%ax
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 6b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6b3:	b1 0a                	mov    $0xa,%cl
        ap++;
 6b5:	66 31 f6             	xor    %si,%si
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 6b8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 6bf:	8b 10                	mov    (%eax),%edx
 6c1:	89 f8                	mov    %edi,%eax
 6c3:	e8 08 fe ff ff       	call   4d0 <printint>
 6c8:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 6cb:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 6cf:	e9 c1 fe ff ff       	jmp    595 <printf+0x35>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 6d4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        ap++;
 6d7:	31 f6                	xor    %esi,%esi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 6d9:	0f be 10             	movsbl (%eax),%edx
 6dc:	89 f8                	mov    %edi,%eax
 6de:	e8 bd fd ff ff       	call   4a0 <putc>
 6e3:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 6e6:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 6ea:	e9 a6 fe ff ff       	jmp    595 <printf+0x35>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
 6ef:	be a6 08 00 00       	mov    $0x8a6,%esi
 6f4:	e9 72 ff ff ff       	jmp    66b <printf+0x10b>
 6f9:	90                   	nop
 6fa:	90                   	nop
 6fb:	90                   	nop
 6fc:	90                   	nop
 6fd:	90                   	nop
 6fe:	90                   	nop
 6ff:	90                   	nop

00000700 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 700:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 701:	a1 c8 08 00 00       	mov    0x8c8,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 706:	89 e5                	mov    %esp,%ebp
 708:	57                   	push   %edi
 709:	56                   	push   %esi
 70a:	53                   	push   %ebx
 70b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*) ap - 1;
 70e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 711:	39 c8                	cmp    %ecx,%eax
 713:	73 1d                	jae    732 <free+0x32>
 715:	8d 76 00             	lea    0x0(%esi),%esi
 718:	8b 10                	mov    (%eax),%edx
 71a:	39 d1                	cmp    %edx,%ecx
 71c:	72 1a                	jb     738 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 71e:	39 d0                	cmp    %edx,%eax
 720:	72 08                	jb     72a <free+0x2a>
 722:	39 c8                	cmp    %ecx,%eax
 724:	72 12                	jb     738 <free+0x38>
 726:	39 d1                	cmp    %edx,%ecx
 728:	72 0e                	jb     738 <free+0x38>
 72a:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 72c:	39 c8                	cmp    %ecx,%eax
 72e:	66 90                	xchg   %ax,%ax
 730:	72 e6                	jb     718 <free+0x18>
 732:	8b 10                	mov    (%eax),%edx
 734:	eb e8                	jmp    71e <free+0x1e>
 736:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 738:	8b 71 04             	mov    0x4(%ecx),%esi
 73b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 73e:	39 d7                	cmp    %edx,%edi
 740:	74 19                	je     75b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 742:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 745:	8b 50 04             	mov    0x4(%eax),%edx
 748:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 74b:	39 ce                	cmp    %ecx,%esi
 74d:	74 21                	je     770 <free+0x70>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 74f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 751:	a3 c8 08 00 00       	mov    %eax,0x8c8
}
 756:	5b                   	pop    %ebx
 757:	5e                   	pop    %esi
 758:	5f                   	pop    %edi
 759:	5d                   	pop    %ebp
 75a:	c3                   	ret    
  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 75b:	03 72 04             	add    0x4(%edx),%esi
    bp->s.ptr = p->s.ptr->s.ptr;
 75e:	8b 12                	mov    (%edx),%edx
  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 760:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 763:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 766:	8b 50 04             	mov    0x4(%eax),%edx
 769:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 76c:	39 ce                	cmp    %ecx,%esi
 76e:	75 df                	jne    74f <free+0x4f>
    p->s.size += bp->s.size;
 770:	03 51 04             	add    0x4(%ecx),%edx
 773:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 776:	8b 53 f8             	mov    -0x8(%ebx),%edx
 779:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 77b:	a3 c8 08 00 00       	mov    %eax,0x8c8
}
 780:	5b                   	pop    %ebx
 781:	5e                   	pop    %esi
 782:	5f                   	pop    %edi
 783:	5d                   	pop    %ebp
 784:	c3                   	ret    
 785:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000790 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	57                   	push   %edi
 794:	56                   	push   %esi
 795:	53                   	push   %ebx
 796:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 799:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 79c:	8b 0d c8 08 00 00    	mov    0x8c8,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a2:	83 c3 07             	add    $0x7,%ebx
 7a5:	c1 eb 03             	shr    $0x3,%ebx
 7a8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7ab:	85 c9                	test   %ecx,%ecx
 7ad:	0f 84 93 00 00 00    	je     846 <malloc+0xb6>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b3:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 7b5:	8b 50 04             	mov    0x4(%eax),%edx
 7b8:	39 d3                	cmp    %edx,%ebx
 7ba:	76 1f                	jbe    7db <malloc+0x4b>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*) (p + 1);
 7bc:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7c3:	90                   	nop
 7c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 7c8:	3b 05 c8 08 00 00    	cmp    0x8c8,%eax
 7ce:	74 30                	je     800 <malloc+0x70>
 7d0:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d2:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 7d4:	8b 50 04             	mov    0x4(%eax),%edx
 7d7:	39 d3                	cmp    %edx,%ebx
 7d9:	77 ed                	ja     7c8 <malloc+0x38>
      if(p->s.size == nunits)
 7db:	39 d3                	cmp    %edx,%ebx
 7dd:	74 61                	je     840 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7df:	29 da                	sub    %ebx,%edx
 7e1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7e4:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7e7:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7ea:	89 0d c8 08 00 00    	mov    %ecx,0x8c8
      return (void*) (p + 1);
 7f0:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7f3:	83 c4 1c             	add    $0x1c,%esp
 7f6:	5b                   	pop    %ebx
 7f7:	5e                   	pop    %esi
 7f8:	5f                   	pop    %edi
 7f9:	5d                   	pop    %ebp
 7fa:	c3                   	ret    
 7fb:	90                   	nop
 7fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < PAGE)
 800:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 806:	b8 00 80 00 00       	mov    $0x8000,%eax
 80b:	bf 00 10 00 00       	mov    $0x1000,%edi
 810:	76 04                	jbe    816 <malloc+0x86>
 812:	89 f0                	mov    %esi,%eax
 814:	89 df                	mov    %ebx,%edi
    nu = PAGE;
  p = sbrk(nu * sizeof(Header));
 816:	89 04 24             	mov    %eax,(%esp)
 819:	e8 42 fc ff ff       	call   460 <sbrk>
  if(p == (char*) -1)
 81e:	83 f8 ff             	cmp    $0xffffffff,%eax
 821:	74 18                	je     83b <malloc+0xab>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 823:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 826:	83 c0 08             	add    $0x8,%eax
 829:	89 04 24             	mov    %eax,(%esp)
 82c:	e8 cf fe ff ff       	call   700 <free>
  return freep;
 831:	8b 0d c8 08 00 00    	mov    0x8c8,%ecx
      }
      freep = prevp;
      return (void*) (p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 837:	85 c9                	test   %ecx,%ecx
 839:	75 97                	jne    7d2 <malloc+0x42>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 83b:	31 c0                	xor    %eax,%eax
 83d:	eb b4                	jmp    7f3 <malloc+0x63>
 83f:	90                   	nop
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 840:	8b 10                	mov    (%eax),%edx
 842:	89 11                	mov    %edx,(%ecx)
 844:	eb a4                	jmp    7ea <malloc+0x5a>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 846:	c7 05 c8 08 00 00 c0 	movl   $0x8c0,0x8c8
 84d:	08 00 00 
    base.s.size = 0;
 850:	b9 c0 08 00 00       	mov    $0x8c0,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 855:	c7 05 c0 08 00 00 c0 	movl   $0x8c0,0x8c0
 85c:	08 00 00 
    base.s.size = 0;
 85f:	c7 05 c4 08 00 00 00 	movl   $0x0,0x8c4
 866:	00 00 00 
 869:	e9 45 ff ff ff       	jmp    7b3 <malloc+0x23>
