#include "common.h"
int
main() {
int readfd; /* дескриптор для чтения из FIFO */
int n;
char buff[MAX_BUFF]; /* буфер для чтения данных из FIFO */
printf("FIFO Server...\n");

if(mknod(FIFO_NAME, S_IFIFO | 0666, 0) < 0)
{
fprintf(stderr, "%s: Невозможно создать FIFO (%s)\n",
__FILE__, strerror(errno));
exit(-1);
}
if((readfd = open(FIFO_NAME, O_RDONLY)) < 0)
{
fprintf(stderr, "%s: Невозможно открыть FIFO (%s)\n",
__FILE__, strerror(errno));
exit(-2);
}
time_t start_time = time(NULL);
while (time(NULL) - start_time <= 30)
{
if ((n = read(readfd, buff, MAX_BUFF)) > 0)
 {
  if(write(1, buff, n) != n)
  {
   fprintf(stderr, "%s: Ошибка вывода (%s)\n", __FILE__, strerror(errno));
   exit(-3);
  }
 }
sleep(1);
}
close(readfd); /* закроем FIFO */
if(unlink(FIFO_NAME) < 0)
{
fprintf(stderr, "%s: Невозможно удалить FIFO (%s)\n",
__FILE__, strerror(errno));
exit(-4);
}
exit(0);
}
