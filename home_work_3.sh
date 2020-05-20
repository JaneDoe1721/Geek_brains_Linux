

# создаем файл с помощью Vim
MacBook-Pro-11:desktop ilaburcev$ vim hello.txt
# вводим команды: print('Hello, world!')
#сохраняем и выходим : wq

# просматриваем создался ли файл
MacBook-Pro-11:desktop ilaburcev$ ls


Golang				hello.txt
PyCharm CE	


# определяем колличесвто строк командой wc -l 
MacBook-Pro-11:desktop ilaburcev$ wc -l hello.txt 
       1 hello.txt
# вывод содержимого с помощью команды cat
MacBook-Pro-11:desktop ilaburcev$ cat hello.txt
print('Hello, world!')

# сначало выводим строку и передаем ее команде wc -l, 
# а она уже подсчитывает 
MacBook-Pro-11:desktop ilaburcev$ cat hello.txt | wc -l
       1

# создаем файл с помощью редактора nano
MacBook-Pro-11:desktop ilaburcev$ nano 
# внутри вводим текст : print('Linear regression.')
# для сохранения текста в файл используется команда : ^O 
# и указывается имя файла, у меня оно linear.txt
# для выхода используется команда: ^X

# просмотр созданного файла
MacBook-Pro-11:desktop ilaburcev$ ls

Golang					hello.txt
PyCharm CE				linear.txt

# конкатенация файлов с помощью cat
MacBook-Pro-11:desktop ilaburcev$ cat hello.txt linear.txt 
print('Hello, world!')
print('Linear regression.')

# объединение двух файлов в один 
MacBook-Pro-11:desktop ilaburcev$ cat hello.txt linear.txt > new_file.txt

# просмотр содержимого файла
MacBook-Pro-11:desktop ilaburcev$ cat new_file.txt
print('Hello, world!')
print('Linear regression.')

# передача файла на подсчет строк и вывод строк через less
MacBook-Pro-11:desktop ilaburcev$ cat new_file.txt | wc -l | less
# less вывод 2
# для выхода используем клавишу q


# с помощью -n нумеруем строки вывода
MacBook-Pro-11:desktop ilaburcev$ cat -n new_file.txt 
     1	print('Hello, world!')
     2	print('Linear regression.')




