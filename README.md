# OTUS Algorithms and structures
Homeworks for curses Algorithms and structures Otus 2021 January

Домашние задания к курсу OTUS "Алгоритмы и структуры" (поток: январь 2021)

## Текущие выполненные задания

- HW1: [Циклы и рекурсия / Loops and recursion](https://github.com/c-villain/OTUS_algo/tree/main/HW1) 
> тесты в [Program.cs](https://github.com/c-villain/OTUS_algo/blob/main/HW1/OTUS_algo/HW1/Program.cs)
<p align="left">
    <img src="https://img.shields.io/badge/language-C%23-blue" /> 
    <img src="https://img.shields.io/badge/IDE-Visual%20Studio-blue" /> 
</p>

- HW2: [Степень, Числа Фибоначчи, Простые числа / Power, Fibonacci numbers, Prime numbers](https://github.com/c-villain/OTUS_algo/tree/main/HW2) 
> тесты в [main.swift](https://github.com/c-villain/OTUS_algo/blob/main/HW2/Otus_algo/main.swift)
<p align="left">
    <img src="https://img.shields.io/badge/language-Swift%205.0-blue" /> 
    <img src="https://img.shields.io/badge/IDE-Xcode-blue" /> 
</p>

### Cравнительная таблица проведённых экспериментов. Затраты времени на операции в мс

#### Алгоритм возведения в степень
Алгоритм возведения в степень|2^10|123456789^0|1.001^1000|1.0001^10000|1.00001^100000|1.000001^1000000|1.0000001^10000000|1.00000001^100000000|1.000000001^1000000000|1.0000000001^10000000000
---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:
Итеративный (n умножений)                      |0.52|0|0.55|5.66|52.6|615.2|5063|44605|x|x
Через степень двойки с домножением             |0.4|0|0.3|0.9|16|209.8|751.8|14240|x|x
Через двоичное разложение показателя степени   |0.3|0|0.016|0.013|0.015|0.015|0.018|0.015|0.019|0.022

#### Алгоритм поиска чисел Фибоначчи

Для работы с большими числами использовал стороннюю библиотеку [BigInt](https://github.com/attaswift/BigInt).

Алгоритм поиска чисел Фибоначчи|0|1|2|3|4|5|10|100|1000|10000|100000|1000000|10000000
---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:
Через рекурсию             |0.3|0.5|0.2|0.0571|0.12|0.12|1.1|x|x|x|x|x|x
Через итерацию             |0.3|0.6|0.2|0.043|0.043|0.043|0.049|0.1|3|169|15417|x|x
По формуле золотого сечения|0.3|0.5|0.2|0.043|0.045|0.031|0.032|0.042|0.4|error in submodule [BigInt](https://github.com/attaswift/BigInt)|x|x|x
Через умножение матриц     |0.3|0.5|0.053|0.082|0.047|0.083|0.09|0.1|1|30|3289|x|x

#### Алгоритмы поиска кол-ва простых чисел

Для работы с большими числами использовал стороннюю библиотеку [BigInt](https://github.com/attaswift/BigInt).

Алгоритмы поиска кол-ва простых чисел до N|10|1|2|3|4|5|100|1000|10000|100000
---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:
Перебор делителей                            |2|0|0|0|0|0|128|12651|x|x
Улучшенный алгоритм перебора делителей       |2|0|0|0|0|0|11|175|3327|70326
Решето Эратосфена                            |2|0|0|0|0|0|6|80|1231|20938


- HW3: [Шахматные биты / Bitboard](https://github.com/c-villain/OTUS_algo/tree/main/HW3) 
> тесты в [main.swift](https://github.com/c-villain/OTUS_algo/blob/main/HW3/Otus_algo/main.swift)
<p align="left">
    <img src="https://img.shields.io/badge/language-Swift%205.0-blue" /> 
    <img src="https://img.shields.io/badge/IDE-Xcode-blue" /> 
</p>

- HW4: [Базовые структуры данных / Basic data structures](https://github.com/c-villain/OTUS_algo/tree/main/HW4) 
> тесты в [main.swift](https://github.com/c-villain/OTUS_algo/blob/main/HW4/Otus_algo/main.swift)

> реализация [PriorityQueue](https://github.com/c-villain/OTUS_algo/blob/main/HW4/Otus_algo/HW4/PriorityQueue/PriorityQueue.swift), тест использования также в [main.swift](https://github.com/c-villain/OTUS_algo/blob/main/HW4/Otus_algo/main.swift)
<p align="left">
    <img src="https://img.shields.io/badge/language-Swift%205.0-blue" /> 
    <img src="https://img.shields.io/badge/IDE-Xcode-blue" /> 
</p>

## Затраты времени на 200_000 операций, мс

Контейнер|Вставка начало|Вставка случайная|Вставка конец|Чтение начало|Чтение случайное|Чтение конец|Удаление начало|Удаление случайное|Удаление конец 
---|---:|---:|---:|---:|---:|---:|---:|---:|---:
SingleArray       |4160|2295|282|0|0|0|3734|2085|124
VectorArray       |4034|2240|303|0|0|0|3793|2021|137
FactorArray       |3954|2066|123|0|0|0|3834|2081|133
NativeArray(Apple)|3852|2022|105|0|0|0|3790|1999|117

## Вывод 
Мне лично было интересно сравнить кастомные реализации массивов с нативной реализацией динамического массива от Apple. Из документации Apple можно сделать вывод, что по сути нативная реализация - реализация factor array (по всей видимости со своим множителем), что косвенно подтверждается, в том числе и проведенными тестами, а также временем их выполнения, которое различается незначительно. **_Поэтому при прочих равных, смысла в кастомной имплементации (то есть использовании функции reserveCapacity() ) размерности массива нет, за исключением случая, когда заранее известно, сколько элементов будет в массиве (чтобы не выделять "лишнюю" память)_**.

Ожидаемо, factorArray в кастомных массивах имеет самую быструю вставку элемента, но операция удаления занимает большее время, чем у остальных (объясняется триггером проверки оставшейся "лишней" памяти после удаления)
