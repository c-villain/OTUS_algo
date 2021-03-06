//
//  main.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 06.02.2021.
//

import Foundation

//HW2

//Алгоритм возведения в степень
//2а  Итеративный (n умножений)
//Результаты замера в с:
//[0] - 0.0005249977111816406s
//[1] - 2.09808349609375 × 10^-05s
//[2] - 0.0005549192428588867s
//[3] - 0.0056650638580322266s
//[4] - 0.05263793468475342s
//[5] - 0.6152609586715698s
//[6] - 5.063616037368774s
//[7] - 44.6049679517746s
//[8] - x
//[9] - x
//let pow_2a = Pow(.iterate)
//let tester_2a = Tester(path: "/Users/c-villain/Downloads/3.Power", task: pow_2a)
//tester_2a.RunTest()


//2b Через степень двойки с домножением
//Результаты замера в с:
//[0] - 0.0004729032516479492s
//[1] - 3.3020973205566406 × 10^-05s
//[2] - 0.00032198429107666016s
//[3] - 0.0009400844573974609s
//[4] - 0.016285061836242676s
//[5] - 0.20988500118255615s
//[6] - 0.7518899440765381s
//[7] - 14.240941047668457s
//[8] - x
//[9] - x
//let pow_2b = Pow(.powerOfTwoWithMultiplaying)
//let tester_2b = Tester(path: "/Users/c-villain/Downloads/3.Power", task: pow_2b)
//tester_2b.RunTest()

//2c Через двоичное разложение показателя степени.
//Результаты замера в с:
//[0] - 0.00035703182220458984s
//[1] - 1.5020370483398438 × 10^-05s
//[2] - 1.609325408935547 × 10^-05s
//[3] - 1.2993812561035156 × 10^-05s
//[4] - 1.5020370483398438 × 10^-05s
//[5] - 1.5020370483398438 × 10^-05s
//[6] - 1.800060272216797 × 10^-05s
//[7] - 1.5020370483398438 × 10^-05s
//[8] - 1.895427703857422 × 10^-05s
//[9] - 2.205371856689453 × 10^-05s
//let pow_2c = Pow(.sumOfPowsOf2)
//let tester_2c = Tester(path: "/Users/c-villain/Downloads/3.Power", task: pow_2c)
//tester_2c.RunTest()

//Алгоритм поиска чисел Фибоначчи
//4a Через рекурсию
//Результаты замера в с:
//[0] - 0.0003420114517211914s
//[1] - 0.0005540847778320312s
//[2] - 0.0002199411392211914s
//[3] - 5.710124969482422 × 10^-05s
//[4] - 0.00012195110321044922s
//[5] - 0.00012004375457763672s
//[6] - 0.0011829137802124023s
//[7] - x
//[8] - x
//[9] - x
//[10] - x
//[11] - x
//[12] - x
//let fibo_4a = Fibo(.recursive)
//let tester_4a = Tester(path: "/Users/c-villain/Downloads/4.Fibo", task: fibo_4a)
//tester_4a.RunTest()

// 4b. Через итерацию
//Результаты замера в с:
//[0] - 0.00033104419708251953s
//[1] - 0.0006059408187866211s
//[2] - 0.00026595592498779297s
//[3] - 4.303455352783203 × 10^-05s
//[4] - 4.398822784423828 × 10^-05s
//[5] - 4.398822784423828 × 10^-05s
//[6] - 4.9114227294921875 × 10^-05s
//[7] - 0.00014603137969970703s
//[8] - 0.0034009218215942383s
//[9] - 0.16958999633789062s
//[10] - 15.417068004608154s
//[11] - x
//[12] - x
//let fibo_4b = Fibo(.iterate)
//let tester_4b = Tester(path: "/Users/c-villain/Downloads/4.Fibo", task: fibo_4b)
//tester_4b.RunTest()

//4c. По формуле золотого сечения
//Результаты замера в с:
//[0] - 0.00039196014404296875s
//[1] - 0.0005959272384643555s
//[2] - 2.8967857360839844 × 10^-05s
//[3] - 4.398822784423828 × 10^-05s
//[4] - 4.506111145019531 × 10^-05s
//[5] - 3.1948089599609375 × 10^-05s
//[6] - 3.2067298889160156 × 10^-05s
//[7] - 4.208087921142578 × 10^-05s
//[8] - 0.00045692920684814453s
//[9] - error in sub-module ¯\_(ツ)_/¯
//[10] - x
//[11] - x
//[12] - x
//let fibo_4c = Fibo(.goldenRatio)
//let tester_4c = Tester(path: "/Users/c-villain/Downloads/4.Fibo", task: fibo_4c)
//tester_4c.RunTest()

//4d. Через умножение матриц
//Результаты замера в с:
//[0] - 0.0003839731216430664s
//[1] - 0.0005789995193481445s
//[2] - 5.3048133850097656 × 10^-05s
//[3] - 8.20159912109375 × 10^-05s
//[4] - 4.792213439941406 × 10^-05s
//[5] - 8.308887481689453 × 10^-05s
//[6] - 9.09566879272461 × 10^-05s
//[7] - 0.0001800060272216797s
//[8] - 0.0010330677032470703s
//[9] - 0.03580498695373535s
//[10] - 3.289650082588196s
//[11] - x
//[12] - x
//let fibo_4d = Fibo(.matrix)
//let tester_4d = Tester(path: "/Users/c-villain/Downloads/4.Fibo", task: fibo_4d)
//tester_4d.RunTest()

//Алгоритмы поиска кол-ва простых чисел до N
//3a. Через перебор делителей.
//Результаты замера в с:
//[0] - 0.0025769472122192383s
//[1] - 3.600120544433594 × 10^-05s
//[2] - 5.602836608886719 × 10^-05s
//[3] - 0.00023496150970458984s
//[4] - 0.00029599666595458984s
//[5] - 0.0004169940948486328s
//[6] - 0.12822604179382324s
//[7] - 12.651883006095886s
//[8] - x
//[9] - x
//[10] - x
//[11] - x
//[12] - x
//[13] - x
//[14] - x
//let prime_3a = CounterOfPrimes(.devisorEnumerated)
//let tester_3a = Tester(path: "/Users/c-villain/Downloads/5.Primes", task: prime_3a)
//tester_3a.RunTest()

//3b. Несколько оптимизаций перебора делителей, с использованием массива.
// Через массив в swift не получится, так как BigInt не умеет работать с массивами ¯\_(ツ)_/¯
// поэтому просто улучшенный алгоритм
//Результаты замера в с:
//[0] - 0.0019949674606323242s
//[1] - 3.600120544433594 × 10^-05s
//[2] - 5.4001808166503906 × 10^-05s
//[3] - 0.00013899803161621094s
//[4] - 0.00020205974578857422s
//[5] - 0.00026702880859375s
//[6] - 0.011430025100708008s
//[7] - 0.17532193660736084s
//[8] - 3.327123999595642s
//[9] - 70.32671892642975s
//[10] - x
//[11] - x
//[12] - x
//[13] - x
//[14] - x
//let prime_3b = CounterOfPrimes(.improvedDevisorEnumerated)
//let tester_3b = Tester(path: "/Users/c-villain/Downloads/5.Primes", task: prime_3b)
//tester_3b.RunTest()

//3c. Решето Эратосфена со сложностью O(n log log n).
//Результаты замера в с:
//[0] - 0.002223968505859375s
//[1] - 3.695487976074219 × 10^-05s
//[2] - 5.900859832763672 × 10^-05s
//[3] - 8.90493392944336 × 10^-05s
//[4] - 0.0001380443572998047s
//[5] - 0.0002200603485107422s
//[6] - 0.005962967872619629s
//[7] - 0.08043408393859863s
//[8] - 1.2315950393676758s
//[9] - 20.938192009925842s
//[10] - x
//[11] - x
//[12] - x
//[13] - x
//[14] - x
let prime_3c = CounterOfPrimes(.eratosphen)
let tester_3c = Tester(path: "/Users/c-villain/Downloads/5.Primes", task: prime_3c)
tester_3c.RunTest()
