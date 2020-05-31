

# №1
# просмотр сколько процессов и оперативной памяти есть на сервере(скриншот №1)
htop

# просмотр имеющихся файлов 
ubuntu@ip-172-31-20-211:~$ ls -l
total 12
-rw-rw-r-- 1 ubuntu ubuntu 35 May 31 08:48 matlib.py
-rw-rw-r-- 1 ubuntu ubuntu 65 May 31 08:45 test.py
-rw-rw-r-- 1 ubuntu ubuntu 19 May 31 08:49 text.py

# №2
# поиск файлов в данной директории с расширением .py
ubuntu@ip-172-31-20-211:~$ find *.py
matlib.py
test.py
text.py

# №3
# записал скрипт вывода чисел от 0 до 100
ubuntu@ip-172-31-20-211:~$ vim matlib.py 

# переводит вывод в новый файл в фоновом режиме
ubuntu@ip-172-31-20-211:~$ python3 matlib.py > matlib.log &
[2] 2542

# ищем процесс в htop (скриншот №2)
ubuntu@ip-172-31-20-211:~$ htop

# выходим
ubuntu@ip-172-31-20-211:~$ htop
[2]-  Done                    python3 matlib.py > matlib.log

# №4
# выводит процессы используемые данным пользователем, короткий вывод
ubuntu@ip-172-31-20-211:~$ ps -U root -u root -N
  PID TTY          TIME CMD
  530 ?        00:00:00 systemd-timesyn
  690 ?        00:00:00 systemd-network
  707 ?        00:00:00 systemd-resolve
  827 ?        00:00:00 rsyslogd
  840 ?        00:00:00 dbus-daemon
 2210 ?        00:00:00 systemd
 2213 ?        00:00:00 (sd-pam)
 2340 ?        00:00:00 sshd
 2346 pts/0    00:00:00 bash
 2516 pts/0    00:00:00 python3
 2728 pts/0    00:00:00 ps

# выводит процессы и сортирует их по указанному параметру, в данном 
# случае сортировка по потреблению оперативной памяти
ubuntu@ip-172-31-20-211:~$ ps -eo pid,ppid,user,cmd,%mem,%cpu --sort=-%mem   | head
  PID  PPID USER     CMD                         %MEM %CPU
  866     1 root     /usr/lib/snapd/snapd         2.5  0.0
  912     1 root     /usr/bin/python3 /usr/share  1.9  0.0
  839     1 root     /usr/bin/python3 /usr/bin/n  1.7  0.0
  460     1 root     /lib/systemd/systemd-journa  1.4  0.0
  846     1 root     /snap/amazon-ssm-agent/1566  1.4  0.0
 2516  2346 ubuntu   python3 matlib.py            0.9  0.0
    1     0 root     /sbin/init                   0.8  0.0
 2210     1 ubuntu   /lib/systemd/systemd --user  0.7  0.0
 2198   901 root     sshd: ubuntu [priv]          0.7  0.0

# то же самое только вывод изменен(вывод показан в скриншоте №3)
ubuntu@ip-172-31-20-211:~$ watch -n 1 'ps -eo pid,ppid,user,cmd,%mem,%cpu --sort=-%mem | head'
