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
> тесты в [main.swift](https://github.com/c-villain/OTUS_algo/blob/main/HW3/Otus_algo/main.swift)
<p align="left">
    <img src="https://img.shields.io/badge/language-Swift%205.0-blue" /> 
    <img src="https://img.shields.io/badge/IDE-Xcode-blue" /> 
</p>

- HW4: [Базовые структуры данных / Basic data structures](https://github.com/c-villain/OTUS_algo/tree/main/HW4) 
> тесты в [main.swift](https://github.com/c-villain/OTUS_algo/blob/main/HW4/Otus_algo/main.swift)

> реализация [PriorityQueue](https://github.com/c-villain/OTUS_algo/blob/main/HW4/Otus_algo/HW4/PriorityQueue/PriorityQueue.swift)
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
Мне лично было интересно сравнить кастомные реализации массивов с нативной реализацией динамического массива от Apple. Из документации Apple можно сделать вывод, что по сути нативная реализация - реализация factor array (по всей видимости со своим множителем), что косвенно подтверждается, в том числе и проведенными тестами, а также временем их выполнения, которое различается незначительно. **_Поэтому при прочих равных, смысла в кастомной имплементации (то есть использовании функции reserveCapacity(_:) )_** **_размерности массива нет, за исключением случая, когда заранее известно, сколько элементов будет в массиве_**.

Ожидаемо, factorArray в кастомных массивах имеет самую быструю вставку элемента, но операция удаления занимает большее время, чем у остальных (объясняется триггером проверки оставшейся "лишней" памяти после удаления)
