
# № 3 Добавить новый диск к используемому инстансу. 

# Это первый инстанс

# Просмотреть доступные дисковые устройства инстанса
ubuntu@ip-172-31-26-211:~$ lsblk
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
loop0     7:0    0   18M  1 loop /snap/amazon-ssm-agent/1566
loop1     7:1    0 93.8M  1 loop /snap/core/8935
xvda    202:0    0    8G  0 disk 
└─xvda1 202:1    0    8G  0 part /
xvdf    202:80   0    2G  0 disk 

# Посмотреть, есть ли файловая система на диске
ubuntu@ip-172-31-26-211:~$ sudo file -s /dev/xvdf
/dev/xvdf: data

# установка файловой системы на диск
ubuntu@ip-172-31-26-211:~$ sudo mkfs -t xfs /dev/xvdf
meta-data=/dev/xvdf              isize=512    agcount=4, agsize=131072 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=1, sparse=0, rmapbt=0, reflink=0
data     =                       bsize=4096   blocks=524288, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal log           bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0


# проверить как установилась файловая система xfs 
ubuntu@ip-172-31-26-211:~$ sudo file -s /dev/xvdf
/dev/xvdf: SGI XFS filesystem data (blksz 4096, inosz 512, v2 dirs)

# создать директорию (точку монтирования)
ubuntu@ip-172-31-26-211:~$ sudo mkdir /data

# МОнтировать диск к точки монтирования 
ubuntu@ip-172-31-26-211:~$ sudo mount /dev/xvdf /data

# проверим подключился ли диск, в них мы видим наш подключенный диск(последняя строка)
ubuntu@ip-172-31-26-211:~$ df
Filesystem     1K-blocks    Used Available Use% Mounted on
udev              491520       0    491520   0% /dev
tmpfs             100732     748     99984   1% /run
/dev/xvda1       8065444 1121528   6927532  14% /
tmpfs             503648       0    503648   0% /dev/shm
tmpfs               5120       0      5120   0% /run/lock
tmpfs             503648       0    503648   0% /sys/fs/cgroup
/dev/loop0         18432   18432         0 100% /snap/amazon-ssm-agent/1566
/dev/loop1         96128   96128         0 100% /snap/core/8935
tmpfs             100728       0    100728   0% /run/user/1000
/dev/xvdf        2086912   35104   2051808   2% /data


# добавляем права на запись в точки монтирования 
ubuntu@ip-172-31-26-211:~$ sudo chmod o+w  /data 

# переходим в диреторию 
ubuntu@ip-172-31-26-211:~$ cd /data/

# создаем файл test.txt
ubuntu@ip-172-31-26-211:/data$ vim test.txt

# видим , что файл создан
ubuntu@ip-172-31-26-211:/data$ ls
test.txt

# проверяем содержимое
ubuntu@ip-172-31-26-211:/data$ cat test.txt 
test

# возвращаемся в домашнюю директорию
ubuntu@ip-172-31-26-211:/data$ cd

# отмантируем диск 
ubuntu@ip-172-31-26-211:~$ sudo umount /data

# проверяем , не нашли
ubuntu@ip-172-31-26-211:~$ df
Filesystem     1K-blocks    Used Available Use% Mounted on
udev              491520       0    491520   0% /dev
tmpfs             100732     748     99984   1% /run
/dev/xvda1       8065444 1121532   6927528  14% /
tmpfs             503648       0    503648   0% /dev/shm
tmpfs               5120       0      5120   0% /run/lock
tmpfs             503648       0    503648   0% /sys/fs/cgroup
/dev/loop0         18432   18432         0 100% /snap/amazon-ssm-agent/1566
/dev/loop1         96128   96128         0 100% /snap/core/8935
tmpfs             100728       0    100728   0% /run/user/1000

# выходим
ubuntu@ip-172-31-26-211:~$ exit
logout
Connection to 18.188.122.170 closed





# Это следующий инстанс

# Просмотреть доступные дисковые устройства инстанса
ubuntu@ip-172-31-26-194:~$ lsblk
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
loop0     7:0    0 93.8M  1 loop /snap/core/8935
loop1     7:1    0   18M  1 loop /snap/amazon-ssm-agent/1566
xvda    202:0    0    8G  0 disk 
└─xvda1 202:1    0    8G  0 part /
xvdf    202:80   0    2G  0 disk 

# проверяем файловую систему на диске, видим что установлена 
ubuntu@ip-172-31-26-194:~$ sudo file -s /dev/xvdf
/dev/xvdf: SGI XFS filesystem data (blksz 4096, inosz 512, v2 dirs)

#создаем на данном инстансе точку монтирования
ubuntu@ip-172-31-26-194:~$ sudo mkdir /data

# монитруем диск 
ubuntu@ip-172-31-26-194:~$ sudo mount /dev/xvdf /data


# преходим в директорию /data
ubuntu@ip-172-31-26-194:~$ cd /data/

# проверяем остался ли файл на диске, видим что остался
ubuntu@ip-172-31-26-194:/data$ ls
test.txt

# и содержимое тоже осталось
ubuntu@ip-172-31-26-194:/data$ cat test.txt
test

# далее я решил сделать автомотическую загрузку диска в данном инстансе

# просмотр UUID диска
ubuntu@ip-172-31-26-194:/data$ blkid
/dev/xvda1: LABEL="cloudimg-rootfs" UUID="6156ec80-9446-4eb1-95e0-9ae6b7a46187" TYPE="ext4" PARTUUID="fe3a9f65-01"

# прописываем в данном файле наш диск
ubuntu@ip-172-31-26-194:/data$ sudo nano /etc/fstab 

# выводим содержимое
ubuntu@ip-172-31-26-194:/data$ cat /etc/fstab 
LABEL=cloudimg-rootfs	/	 ext4	defaults,discard	0 0
UUID=6156ec80-9446-4eb1-95e0-9ae6b7a46187 /data  xfs  defaults,nofail  0  2

# сначало отмантируем
ubuntu@ip-172-31-26-194:/data$ sudo umount /data
umount: /data: target is busy.

# подмантируем обратно все фаловые системы файла /etc/fstab
ubuntu@ip-172-31-26-194:/data$ sudo mount -a
mount: /data: /dev/xvda1 already mounted on /.

# видим диск подключен
ubuntu@ip-172-31-26-194:/data$ df
Filesystem     1K-blocks    Used Available Use% Mounted on
udev              491520       0    491520   0% /dev
tmpfs             100732     748     99984   1% /run
/dev/xvda1       8065444 1123676   6925384  14% /
tmpfs             503648       0    503648   0% /dev/shm
tmpfs               5120       0      5120   0% /run/lock
tmpfs             503648       0    503648   0% /sys/fs/cgroup
/dev/loop1         18432   18432         0 100% /snap/amazon-ssm-agent/1566
/dev/loop0         96128   96128         0 100% /snap/core/8935
tmpfs             100728       0    100728   0% /run/user/1000
/dev/xvdf        2086912   35108   2051804   2% /data

# выходим
ubuntu@ip-172-31-26-194:/data$ exit
logout
Connection to 3.15.160.227 closed.





