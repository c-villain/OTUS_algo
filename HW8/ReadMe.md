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

Хеш-табли́ца — это структура данных, реализующая интерфейс ассоциативного массива, а именно, она позволяет хранить пары (ключ, значение) и выполнять три операции: операцию добавления новой пары, операцию поиска и операцию удаления пары по ключу.

> тесты в [main.swift](https://github.com/c-villain/OTUS_algo/blob/main/HW8/HashTables/main.swift)

## Таблица производительности для релизации хэш-таблицы с реализацией разрешения коллизий [методом цепочек](https://ru.wikipedia.org/wiki/Хеш-таблица#Метод_цепочек)

Каждая ячейка массива H является указателем на связный список (цепочку) пар ключ-значение, соответствующих одному и тому же хеш-значению ключа. Коллизии просто приводят к тому, что появляются цепочки длиной более одного элемента.

 Operation in Hash table ([separate chaining](https://en.wikipedia.org/wiki/Hash_table#Separate_chaining))|100_000| 1_000_000 |10_000_000 
  ---|---:|---:|---:
 Creation (Insertion)                                                                                     |0.36   | 4.8       |44          
 Searching                                                                                                |0.19   | 1.9       |18.5         
 Removing                                                                                                 |0.02   | 0.2       |2.14    
 
 ## Таблица производительности для релизации хэш-таблицы с реализацией разрешения коллизий [методом открытой адресации](https://ru.wikipedia.org/wiki/Хеш-таблица#Открытая_адресация)
 
 В массиве H хранятся сами пары ключ-значение. Алгоритм вставки элемента проверяет ячейки массива H в некотором порядке до тех пор, пока не будет найдена первая свободная ячейка, в которую и будет записан новый элемент. Этот порядок вычисляется на лету, что позволяет сэкономить на памяти для указателей, требующихся в хеш-таблицах с цепочками.
 
 ### Открытая адресация с [линейным пробингом](https://en.wikipedia.org/wiki/Linear_probing)
  
 Ячейки хеш-таблицы последовательно просматриваются с некоторым фиксированным интервалом k между ячейками 
  
 Случай с шагом 0 является вырожденным, просматриваем каждую следующую ячейку пока не найдем пустую или же по пути не встретим лениво удаленную ячейку, чтоб при просмотре таблицы до конца, можно было сделать оптимизацию поместить очередной ключ на место удаленной ячейки.
 
 Operation in Hash table ([linear probing](https://en.wikipedia.org/wiki/Linear_probing), a = 0)  |100_000| 1_000_000 |10_000_000 
  ---|---:|---:|---:
 Creation (Insertion)                             |0.43   | 6.8       |63          
 Searching                                        |0.2    | 2.14      |22.7         
 Removing                                         |0.02   | 0.2       |2.3    
 
 Для классического случая линейного пробинга обычно берут шаг 1, я для теста взял шаг 4.
 
 Operation in Hash table ([linear probing](https://en.wikipedia.org/wiki/Linear_probing), a = 4)  |100_000| 1_000_000 |10_000_000 
  ---|---:|---:|---:
 Creation (Insertion)                             |0.41   | 6.7        |60.6          
 Searching                                        |0.19   | 1.83       |22         
 Removing                                         |0.02   | 0.22       |2.43    
 
 ### Открытая адресация с [квадратичным пробингом](https://en.wikipedia.org/wiki/Quadratic_probing)

Интервал между ячейками с каждым шагом увеличивается на константу.

Для примера взял коэффициенты (0,2), то есть участвует только квадратичная константа.

 Operation in Hash table (quadratic probing, c1=0, c2=2 )      |100_000| 1_000_000 |10_000_000 
  ---|---:|---:|---:
 Creation (Insertion)                                          |0.43   | 6.2       |59.7          
 Searching                                                     |0.2    | 1.79      |22.7         
 Removing                                                      |0.02   | 0.19      |2.27    
 
### Открытая адресация с [двойным хэшированием](https://en.wikipedia.org/wiki/Double_hashing)
  
Интервал между ячейками фиксирован, как при линейном пробировании, но, в отличие от него, размер интервала вычисляется второй, вспомогательной хеш-функцией, а значит, может быть различным для разных ключей.
  
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


Пояснение к таблицам: как видим на практике быстрее всего работает реализация хэш-таблицы с разрешением коллизий методом цепочек, обусловлено это тем, что не надо вычислять хэш на i-ой попытке вставить ключ как в методе открытой адресации, однако такая реализация требует дополнительной памяти для цепочек. Хэш-таблицы с разрешением коллизий методом открытой адресации также работают за линейное время, немного дольше, но не требуется дополнительной памяти. На практике практически одинаковое время показали таблицы с двойным и квадратичным пробингом.
