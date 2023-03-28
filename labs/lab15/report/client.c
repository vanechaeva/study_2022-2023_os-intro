#include "common.h"
#define MESSAGE_SIZE 50
#define MESSAGE "Hello Server!!!\n"
#define SLEEP_TIME 5

int main()
{
    int writefd; /* дескриптор для записи в FIFO */
    int msglen;
    /* баннер */
    printf("FIFO Client...\n");
    /* получим доступ к FIFO */
    if((writefd = open(FIFO_NAME, O_WRONLY)) < 0)
    {
        fprintf(stderr, "%s: Невозможно открыть FIFO (%s)\n",
        __FILE__, strerror(errno));
        exit(-1);
    }
    /* передадим сообщение серверу */
    msglen = strlen(MESSAGE);
    char* tty_path = ttyname(STDOUT_FILENO);
    char tty_num = tty_path[strlen(tty_path) - 1];
    char message[MESSAGE_SIZE];
    while (1) {
        time_t t = time(NULL);
        struct tm* tm_info = localtime(&t);
        strftime(message, MESSAGE_SIZE, "%Y-%m-%d %H:%M:%S", localtime(&t));
        sprintf(message, "%s TTY%d", message, tty_num - '0');
        strcat(message, "\n");
        if(write(writefd, message, strlen(message)) != strlen(message))
        {
            fprintf(stderr, "%s: Ошибка записи в FIFO (%s)\n",
            __FILE__, strerror(errno));
            exit(-2);
        }
        sleep(SLEEP_TIME);
    }
    /* закроем доступ к FIFO */
    close(writefd);
    exit(0);
}
