# Хэш-таблицы
## Домашнее задание

### Цель: Создать хэш-таблицу

1 часть. 

Реализовать хеш-таблицу, использующую метод цепочек.

Методы к реализации: 

- void put(K key, V value) - вставка/замена элемента 
- V get(K key) - поиск элемента 
- V del(K key) - удаление элемента 
- void rehash() - рехеширование по достижению 75% заполнения int hash(K key)

Протестировать работу алгоритма. 

Для различных значений N степени 10: 10, 100, 1000, ... Максимальное количество элементов такое, чтобы программа работала не дольше двух минут.

Создать пустую таблицу. 

Добавить N пар записей такого вида: Key: random(0, N-1).toString() Val: тоже самое значение как число 

Искать N случайных чисел. Удалить N/10 случайных элементов.

Заполнить таблицу производительности и сделать вывод.

2 часть. 
Реализовать хеш-таблицу, использующую открытую адресацию, 

Методы к реализации:

- void put(K key, V value) - вставка/замена элемента 
- V get(K key) - поиск элемента 
- V del(K key) - удаление элемента 
- void rehash() - рехеширование по достижению 75% заполнения 
- int hash(K key, int i) - хэширование на i-ом пробинге

Реализовать вариант линейного, квадратичного и двойного пробинга

# Выводы

## [Hash tables](https://en.wikipedia.org/wiki/Hash_table) / [Хеш-таблица](https://ru.wikipedia.org/wiki/Хеш-таблица)

> тесты в [main.swift](https://github.com/c-villain/OTUS_algo/blob/main/HW8/HashTables/main.swift)

### Таблица производительности для релизации хэш-таблицы методом цепочек 

N - количество пар записей 

 Operation in Hash table                  |100_000| 1_000_000 |10_000_000 
  ---|---:|---:|---:
 Creation (Insertion)                     |0.36   | 4.8       |44          
 Searching                                |0.19   | 1.9       |18.5         
 Removing                                 |0.02   | 0.2       |2.14    
 
 
 Operation in Hash table (linear probing, a = 0)  |100_000| 1_000_000 |10_000_000 
  ---|---:|---:|---:
 Creation (Insertion)                             |0.43   | 6.8       |63          
 Searching                                        |0.2    | 2.14      |22.7         
 Removing                                         |0.02   | 0.2       |2.3    
 
 Operation in Hash table (linear probing, a = 4)  |100_000| 1_000_000 |10_000_000 
  ---|---:|---:|---:
 Creation (Insertion)                             |0.41   | 6.7        |60.6          
 Searching                                        |0.19   | 1.83       |22         
 Removing                                         |0.02   | 0.22       |2.43    
 

 Operation in Hash table (quadratic probing, c1=0, c2=2 )      |100_000| 1_000_000 |10_000_000 
  ---|---:|---:|---:
 Creation (Insertion)                                          |0.43   | 6.2       |59.7          
 Searching                                                     |0.2    | 1.79       |22.7         
 Removing                                                      |0.02   | 0.19       |2.27    
 
 
Double probing.
В качестве функции второго хэширования взял следующую:

```swift
 private func hash2 (key: Key, prime: Int) -> Int {
     prime - (key.hashValue % prime)       
 }
 ```
 
Operation in Hash table (double probing)          |100_000| 1_000_000 |10_000_000 
  ---|---:|---:|---:
 Creation (Insertion)                             |0.43   | 6.4       |59.7          
 Searching                                        |0.19   | 1.9       |20.2         
 Removing                                         |0.02   | 0.2       |2.03    
