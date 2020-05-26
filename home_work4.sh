# создание файла с помощью touch
ubuntu@ip-172-31-20-211:~$ touch new_file.py
# проверка создания
ubuntu@ip-172-31-20-211:~$ ls
new_file.py
# записываем программу в файл
ubuntu@ip-172-31-20-211:~$ vim new_file.py 
# выводим
ubuntu@ip-172-31-20-211:~$ cat new_file.py 
print('Hello, world!')

# проверка пользователя
ubuntu@ip-172-31-20-211:~$ whoami
ubuntu

# проверка группы пользователей
ubuntu@ip-172-31-20-211:~$ groups
ubuntu adm dialout cdrom floppy sudo audio dip video plugdev lxd netdev

# создание нового пользователя с домашней директорией
ubuntu@ip-172-31-20-211:~$ sudo useradd -m -s /bin/bash user_new
# создание пароля новому пользователю
ubuntu@ip-172-31-20-211:~$ sudo passwd user_new 
Enter new UNIX password: 
Retype new UNIX password: 
passwd: password updated successfully

# проверка нового пользователя
ubuntu@ip-172-31-20-211:~$ cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-network:x:100:102:systemd Network Management,,,:/run/systemd/netif:/usr/sbin/nologin
systemd-resolve:x:101:103:systemd Resolver,,,:/run/systemd/resolve:/usr/sbin/nologin
syslog:x:102:106::/home/syslog:/usr/sbin/nologin
messagebus:x:103:107::/nonexistent:/usr/sbin/nologin
_apt:x:104:65534::/nonexistent:/usr/sbin/nologin
lxd:x:105:65534::/var/lib/lxd/:/bin/false
uuidd:x:106:110::/run/uuidd:/usr/sbin/nologin
dnsmasq:x:107:65534:dnsmasq,,,:/var/lib/misc:/usr/sbin/nologin
landscape:x:108:112::/var/lib/landscape:/usr/sbin/nologin
sshd:x:109:65534::/run/sshd:/usr/sbin/nologin
pollinate:x:110:1::/var/cache/pollinate:/bin/false
ubuntu:x:1000:1000:Ubuntu:/home/ubuntu:/bin/bash
user1:x:1001:1001::/home/user1:/bin/bash
user_new:x:1002:1002::/home/user_new:/bin/bash

# Посмотрим, какие параметры будут даны пользователю 
ubuntu@ip-172-31-20-211:~$ useradd -D
GROUP=100
HOME=/home
INACTIVE=-1
EXPIRE=
SHELL=/bin/sh
SKEL=/etc/skel
CREATE_MAIL_SPOOL=no
ubuntu@ip-172-31-20-211:~$ cat /etc/default/useradd
# Default values for useradd(8)
#
# The SHELL variable specifies the default login shell on your
# system.
# Similar to DHSELL in adduser. However, we use "sh" here because
# useradd is a low level utility and should be as general
# as possible
SHELL=/bin/sh
#
# The default group for users
# 100=users on Debian systems
# Same as USERS_GID in adduser
# This argument is used when the -n flag is specified.
# The default behavior (when -n and -g are not specified) is to create a
# primary user group with the same name as the user being added to the
# system.
# GROUP=100
#
# The default home directory. Same as DHOME for adduser
# HOME=/home
#
# The number of days after a password expires until the account 
# is permanently disabled
# INACTIVE=-1
#
# The default expire date
# EXPIRE=
#
# The SKEL variable specifies the directory containing "skeletal" user
# files; in other words, files such as a sample .profile that will be
# copied to the new user's home directory when it is created.
# SKEL=/etc/skel
#
# Defines whether the mail spool should be created while
# creating the account
# CREATE_MAIL_SPOOL=yes


# забыл название файла)
ubuntu@ip-172-31-20-211:~$ ls
new_file.py

# добавляем права на чтение, запись и использование скриптов
ubuntu@ip-172-31-20-211:~$ chmod o=xrw new_file.py 
ubuntu@ip-172-31-20-211:~$ ls -l
total 4
-rw-rw-rwx 1 ubuntu ubuntu 25 May 26 20:35 new_file.py

# меняем пользователя
ubuntu@ip-172-31-20-211:~$ su user_new 
Password: 


# добавляем немного кода в программу
user_new@ip-172-31-20-211:/home/ubuntu$ vim new_file.py 

#!/usr/bin/pytho3
# print('Hello, world!\n' *3)

# запускаем скрипт
user_new@ip-172-31-20-211:/home/ubuntu$ ./new_file.py 
Hello, world!
Hello, world!
Hello, world!


# заходим в домашнюю директорию
user_new@ip-172-31-20-211:/home/ubuntu$ cd

# создаем файл 
user_new@ip-172-31-20-211:~$ touch numbers.py

# проверяем
user_new@ip-172-31-20-211:~$ ls -l
total 0
-rw-rw-r-- 1 user_new user_new 0 May 26 20:39 numbers.py

# добавляем права на исполнения
user_new@ip-172-31-20-211:~$ chmod u=xrw,g=rwx numbers.py 

# проверяем
user_new@ip-172-31-20-211:~$ ls -l
total 4
-rwxrwxr-- 1 user_new user_new 59 May 26 20:42 numbers.py



# пишем программу
user_new@ip-172-31-20-211:~$ vim numbers.py

#!/usr/bin/python3
#import time
#for itm in range(1, 11):
#	print(itm)
#	time.sleep(1)

# запуск скрипта
user_new@ip-172-31-20-211:~$ ./numbers.py
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

# выходим, получаем ошибку 
user_new@ip-172-31-20-211:~$ exit
exit
There are stopped jobs.

# останавливаем процесс командой jobs
user_new@ip-172-31-20-211:~$ jobs
[1]+  Stopped                 ./numbers.py

# пробуем выйти еще раз
user_new@ip-172-31-20-211:~$ exit
exit
