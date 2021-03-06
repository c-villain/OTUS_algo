# Домашнее задание
## Степень, Числа Фибоначчи, Простые числа
### Цель: написать и сравнить разные алгоритмы возведения числа в целую степень, вычисления чисел фибоначчи и поиска простых чисел.
Написать следующие алгоритмы и сравнить их быстродействие и результаты.
Приложить скриншоты/ссылки на сравнительную таблицу проведённых экспериментов.

1. Алгоритм возведения в степень макс. 2 байта
2а. Итеративный (n умножений)
2b. Через степень двойки с домножением
+1 байт 2c. Через двоичное разложение показателя степени.
+1 байт Составить сравнительную таблицу времени работы алгоритмов для разных начальных данных.

2. Алгоритм поиска чисел Фибоначчи макс. 4 байта
4a. Через рекурсию 
+1 байт 4b. Через итерацию
+1 байт 4c. По формуле золотого сечения
+1 байт 4d. Через умножение матриц
+1 байт Составить сравнительную таблицу времени работы алгоритмов для разных начальных данных.

3. Алгоритмы поиска кол-ва простых чисел до N макс. 4 байт
3a. Через перебор делителей.
+1 байт 3b. Несколько оптимизаций перебора делителей, с использованием массива.
+1 байт 3c. Решето Эратосфена со сложностью O(n log log n).
на выбор:
+1 байт 3d. Решето Эратосфена с оптимизацией памяти: битовая матрица, по 32 значения в одном int
или
+1 байт 3e. Решето Эратосфена со сложностью O(n)
+1 байт Составить сравнительную таблицу времени работы алгоритмов для разных начальных данных.

# Алгебраические алгоритмы

Степень, Числа Фибоначчи, Простые числа

> тесты в [main.swift](https://github.com/c-villain/OTUS_algo/blob/main/HW2/Otus_algo/main.swift)

## Cравнительная таблица проведённых экспериментов. Затраты времени на операции в мс

### Алгоритм возведения в степень
Алгоритм возведения в степень|2^10|123456789^0|1.001^1000|1.0001^10000|1.00001^100000|1.000001^1000000|1.0000001^10000000|1.00000001^100000000|1.000000001^1000000000|1.0000000001^10000000000
---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:
Итеративный (n умножений)                      |0.52|0|0.55|5.66|52.6|615.2|5063|44605|x|x
Через степень двойки с домножением             |0.4|0|0.3|0.9|16|209.8|751.8|14240|x|x
Через двоичное разложение показателя степени   |0.3|0|0.016|0.013|0.015|0.015|0.018|0.015|0.019|0.022

### Алгоритм поиска чисел Фибоначчи

Для работы с большими числами использовал стороннюю библиотеку [BigInt](https://github.com/attaswift/BigInt).

Алгоритм поиска чисел Фибоначчи|0|1|2|3|4|5|10|100|1000|10000|100000|1000000|10000000
---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:
Через рекурсию             |0.3|0.5|0.2|0.0571|0.12|0.12|1.1|x|x|x|x|x|x
Через итерацию             |0.3|0.6|0.2|0.043|0.043|0.043|0.049|0.1|3|169|15417|x|x
По формуле золотого сечения|0.3|0.5|0.2|0.043|0.045|0.031|0.032|0.042|0.4|error in submodule [BigInt](https://github.com/attaswift/BigInt)|x|x|x
Через умножение матриц     |0.3|0.5|0.053|0.082|0.047|0.083|0.09|0.1|1|30|3289|x|x

### Алгоритмы поиска кол-ва простых чисел

Для работы с большими числами использовал стороннюю библиотеку [BigInt](https://github.com/attaswift/BigInt).

Алгоритмы поиска кол-ва простых чисел до N|10|1|2|3|4|5|100|1000|10000|100000
---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:
Перебор делителей                            |2|0|0|0|0|0|128|12651|x|x
Улучшенный алгоритм перебора делителей       |2|0|0|0|0|0|11|175|3327|70326
Решето Эратосфена                            |2|0|0|0|0|0|6|80|1231|20938

