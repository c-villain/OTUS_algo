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

- HW3: [Шахматные биты / Bitboard](https://github.com/c-villain/OTUS_algo/tree/main/HW3) 

Based on [bitboard calculator](https://gekomad.github.io/Cinnamon/BitboardCalculator/)

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

- HW5: [Простые и пирамидальные сортировки / Simple and heap sorts](https://github.com/c-villain/OTUS_algo/tree/main/HW4) 

### Затраты времени на сортировку массивов из n-элементов, сек

- random - из случайных чисел
 
- digits - из цифр 
 
- sorted - почти отсортированного
 
- revers - отсортированного в обратном порядке

BubbleSort|1|10|100|1000|10.000|100.000|1.000.000
---|---:|---:|---:|---:|---:|---:|---:
random       |0|0|0.004|0.382|39|x|x
digits       |0|0|0.003|0.38|37.6|x|x
sorted       |0|0|0.004|0.367|35.95|x|x|
revers       |0|0|0.004|0.4|40.8|x|x

InsertSort|1|10|100|1000|10.000|100.000|1.000.000|10.000.000
---|---:|---:|---:|---:|---:|---:|---:|---:
random       |0|0|0|0.017|1.7|171|x|x
digits       |0|0|0|0.016|1.5|148|x|x
sorted       |0|0|0|0.001|0.05|4.31|443|x
revers       |0|0|0|0.034|3.34|341|x|x

> ShellSort where gap = N/ (2^k) : N / 2, N / 4, ..., 1
> 
> Worst cost О(n^2)

ShellSort    |1|10|100|1000|10.000|100.000|1.000.000|10.000.000
---|---:|---:|---:|---:|---:|---:|---:|---:
random       |0|0|0|0.008|0.11|1.37|18|231
digits       |0|0|0|0.007|0.1|1.21|14.8|176
sorted       |0|0|0|0.007|0.11|1.3|16|195
revers       |0|0|0|0.007|0.1|1.26|15.25|182

> ShellSort = HibbardSort where gap = 2^k - 1: 1, 3, 7, 15, 31, 63,..
> 
> Worst cost О(n^3/2)

HibbardSort  |1|10|100|1000|10.000|100.000|1.000.000|10.000.000
---|---:|---:|---:|---:|---:|---:|---:|---:
random       |0|0|0|0.008|0.11|1.4|17.4|225
digits       |0|0|0|0.008|0.1|1.16|14.1|167.5
sorted       |0|0|0|0.008|0.1|1.24|15.44|194.6
revers       |0|0|0|0.007|0.1|1.24|15.12|180

> ShellSort = KnuthSort where gap = (3^k - 1)/2 not greater than [N / 3]: 1, 4, 13, 40, 121, ..
> 
> Worst cost О(n^3/2)

KnuthSort    |1|10|100|1000|10.000|100.000|1.000.000|10.000.000
---|---:|---:|---:|---:|---:|---:|---:|---:
random       |0|0|0|0.004|0.078|0.94|12.4|177
digits       |0|0|0|0.004|0.067|0.78|9.9|110.5
sorted       |0|0|0|0.005|0.067|0.91|11.3|140
revers       |0|0|0|0.006|0.067|0.88|10.2|113

Как видим, сортировка Шелла с шагом, предложенным Кнутом (основанный на методе Пратта), явялется одним из самым эффективых.
