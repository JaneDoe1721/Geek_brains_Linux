# № 1
# Выбрать из домашней директории пользователя ubuntu файлы с расширением .py,
# название которых начинается на букву t.

# просмотр файлов 
ubuntu@ip-172-31-26-211:~$ ls
config.py  lesson7  matrix.py  number1.py  test.py  text.py

# вывод файлов с расширение .py в текущей директории
# (текущую директорию можно указать просто как '.' )
ubuntu@ip-172-31-26-211:~$ ls '.' | grep '.py'
config.py
matrix.py
number1.py
test.py
text.py

# вывод файлов с расширение .py в текущей директории, название которых начинается на букву t
# (текущую директорию можно указать просто как '.' )
ubuntu@ip-172-31-26-211:~$ ls '.' | grep '^t.*.py$'
test.py
text.py



# № 2
# Из всех файлов с расширением .py, расположенных в домашней директории 
# пользователя ubuntu, выбрать строки, содержащие команду print, и вывести их на экран.

# вывод всех print во всех файлах 
ubuntu@ip-172-31-26-211:~$ cat *.py | grep print 
print(a + c + b)
print(random.randint(1, 20))
print('My name Hawk')
print(1234)


# вывод названия файлов и команду которую мы искали 
ubuntu@ip-172-31-26-211:~$ ls ~ | grep print *.py 
matrix.py:print(a + c + b)
number1.py:print(random.randint(1, 20))
text.py:print('My name Hawk')
text.py:print(1234)


# №3
# Из результатов работы команды uptime выведите число дней, 
# которое система работает без перезагрузки.

# обычный запуск команды uptime
ubuntu@ip-172-31-26-211:~$ uptime
 09:02:48 up 26 min,  1 user,  load average: 0.00, 0.00, 0.00

# запуск полного шаблоны команды uptime через sed
ubuntu@ip-172-31-26-211:~$ uptime | sed 's/^.* up \+\ \+user.*/1/'
 09:04:58 up 28 min,  1 user,  load average: 0.00, 0.00, 0.00

# выводит время, сколько работае система
ubuntu@ip-172-31-26-211:~$ uptime | sed 's/^.* up \+\(.\+\), \+[0-9]\+ \+user.*/\1/'
36 min

# решил попробовать через awk, можно добится почти такого же результата
ubuntu@ip-172-31-26-211:~$ uptime | awk '{print $2" " $3" "$4}'
up 50 min,


