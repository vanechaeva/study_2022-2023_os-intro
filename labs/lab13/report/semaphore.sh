t1=10
t2=15
semaphore=0
lock="lockfile"
tty_num=$(tty | cut -c 9-)

while true
do
  while [ $semaphore -ne 0 ]
   do
    echo "Процесс $BASHPID ждет освобождения ресурса"
    sleep 1
   done

  echo "Процесс $BASHPID блокирует ресурс"
  touch $lock

  echo "Процесс $BASHPID использует ресурс в течение $t2 секунд"
  sleep $t2

  echo "Процесс $BASHPID освобождает ресурс"
  rm $lock

  semaphore=0

  echo "Процесс $BASHPID ожидает $t1 секунд"
  sleep $t1
  semaphore=1
done
