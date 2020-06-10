
# №1
# Вывести на экран 3 раза имя пользователя, от которого запускается команда.

# узнаем имя пользоватлея
ubuntu@ip-172-31-26-211:~$ whoami
ubuntu

# запишем скрипт с помощью vim
ubuntu@ip-172-31-26-211:~$ vim script1.sh
# Скрипт
for itm in {1..3};
>do
>  whoami
>done

# смотрим на список файлов
ubuntu@ip-172-31-26-211:~$ ls
config.py  lesson8    number1.py  test.py
lesson7    matrix.py  script1.sh  text.py

# добавляем права на исполнение
ubuntu@ip-172-31-26-211:~$ chmod +x script1.sh 

# проверяем добовление прав
ubuntu@ip-172-31-26-211:~$ ls -l
total 32
-rw-rw-r-- 1 ubuntu ubuntu   58 Jun  5 08:48 config.py
drwxrwxr-x 2 ubuntu ubuntu 4096 Jun  4 17:41 lesson7
drwxrwxr-x 2 ubuntu ubuntu 4096 Jun  8 18:52 lesson8
-rw-rw-r-- 1 ubuntu ubuntu   40 Jun  5 08:44 matrix.py
-rw-rw-r-- 1 ubuntu ubuntu   44 Jun  5 08:50 number1.py
-rwxrwxr-x 1 ubuntu ubuntu   43 Jun  9 18:44 script1.sh
-rw-rw-r-- 1 ubuntu ubuntu   46 Jun  5 08:49 test.py
-rw-rw-r-- 1 ubuntu ubuntu   34 Jun  5 08:45 text.py

# исполняем скрипт
ubuntu@ip-172-31-26-211:~$ ~/script1.sh 
ubuntu
ubuntu
ubuntu

ubuntu@ip-172-31-26-211:~$ ./script1.sh 
ubuntu
ubuntu
ubuntu

# №2
# Вывести с помощью цикла while все четные числа от 0 до 100 включительно.

# создаем скрипт
ubuntu@ip-172-31-26-211:~$ vim script_while.sh
# сам скрипт
n=0
while [ $n -lt 101 ]
do
  echo $n
  n=$(( $n + 1))
done

# добавление прав на исполнение
ubuntu@ip-172-31-26-211:~$ chmod +x script_while.sh 

# проверка прав
ubuntu@ip-172-31-26-211:~$ ls -l
total 36
-rw-rw-r-- 1 ubuntu ubuntu   58 Jun  5 08:48 config.py
drwxrwxr-x 2 ubuntu ubuntu 4096 Jun  4 17:41 lesson7
drwxrwxr-x 2 ubuntu ubuntu 4096 Jun  8 18:52 lesson8
-rw-rw-r-- 1 ubuntu ubuntu   40 Jun  5 08:44 matrix.py
-rw-rw-r-- 1 ubuntu ubuntu   44 Jun  5 08:50 number1.py
-rwxrwxr-x 1 ubuntu ubuntu   43 Jun  9 18:44 script1.sh
-rwxrwxr-x 1 ubuntu ubuntu   61 Jun  9 18:50 script_while.sh
-rw-rw-r-- 1 ubuntu ubuntu   46 Jun  5 08:49 test.py
-rw-rw-r-- 1 ubuntu ubuntu   34 Jun  5 08:45 text.py

# проверяем скрипт
ubuntu@ip-172-31-26-211:~$ ~/script_while.sh 
0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100

#№3
# Создать с помощью nano файл test.txt. Настроить автоматический бэкап этого файла раз в 10 минут в файл с названием test.txt.bak с использованием cron.

# создаем файл test.txt с помощью nano
ubuntu@ip-172-31-22-250:~$ nano test.txt
# записываем Скрипт 

#!/bin/bash
# Создать с помощью nano файл test.txt. 
# Настроить автоматический бэкап  этого файла раз в 10 минут в файл с названием test.txt.bak с использованием cron.

cp -f test.txt test.txt.bak


#  добавляем права на исполнение
ubuntu@ip-172-31-22-250:~$ chmod +x tes.txt

# смотрим список файлов 
ubuntu@ip-172-31-22-250:~$ ls
test.txt

# настраиваем автомотизацию скрипта с помощью cron
ubuntu@ip-172-31-22-250:~$ crontab -e
*/10 * * * * /home/ubuntu/test.txt
# после выхода получаем сообщение
crontab: installing new crontab

# с помощью комманды проверяем выполнение автомотизации
ubuntu@ip-172-31-22-250:~$ tail -f /var/log/syslog | grep cron
Jun 10 07:56:40 ip-172-31-22-250 crontab[1764]: (ubuntu) BEGIN EDIT (ubuntu)
Jun 10 07:56:46 ip-172-31-22-250 crontab[1764]: (ubuntu) END EDIT (ubuntu)
Jun 10 07:57:05 ip-172-31-22-250 crontab[1778]: (ubuntu) BEGIN EDIT (ubuntu)
Jun 10 07:57:17 ip-172-31-22-250 crontab[1778]: (ubuntu) REPLACE (ubuntu)
Jun 10 07:57:17 ip-172-31-22-250 crontab[1778]: (ubuntu) END EDIT (ubuntu)
Jun 10 07:58:01 ip-172-31-22-250 cron[751]: (ubuntu) RELOAD (crontabs/ubuntu)
Jun 10 08:12:03 ip-172-31-22-250 crontab[1829]: (ubuntu) BEGIN EDIT (ubuntu)
Jun 10 08:12:17 ip-172-31-22-250 crontab[1829]: (ubuntu) END EDIT (ubuntu)
Jun 10 08:17:01 ip-172-31-22-250 CRON[1847]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
^C    

# файл создан  
ubuntu@ip-172-31-22-250:~$ ls
test.txt  test.txt.bak



