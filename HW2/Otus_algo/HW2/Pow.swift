//
//  Pow.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 06.02.2021.
//

import Foundation

/**
На первой строчке записано вещественное число A > 0.
На второй строчке записано целое число N >= 0.

Вычислить A^N. Результат вывести на экран в стандартном виде.

Решить задачу разными способами.
1. Через обычные итерации.
2. Через степень двойки с домножением.
3. Через двоичное разложение показателя степени.
*/

class Pow: Task {
    
    private var type: algoType
    init(_ type: algoType) {
        self.type = type
    }
    
    enum algoType {
        case iterate
        case powerOfTwoWithMultiplaying
        case sumOfPowsOf2
    }
    
    ///формат файла: первая строка - число, вторая строка - степень
    func run(_ data: [String]) -> String {
        let base = Double(data[0])!
        let pow = Int(data[1])!
        var baseInPow: Double
        switch type {
        case .iterate:
            baseInPow = self.iteratePow(base: base, power: pow)
        case .powerOfTwoWithMultiplaying:
            baseInPow = powerOfTwoWithMultiplayingPow(base: base, power: pow)
        case .sumOfPowsOf2:
            baseInPow = sumOfPowsOf2(base: base, power: pow)
        }
        let isInteger = floor(baseInPow) == baseInPow
        // если целое число, то возвращаем один знак после запятой, иначе 11 знаков после запятой (для тестов)
        if isInteger { return String(format: "%.1f", baseInPow)}
        else { return String(format: "%.11f", baseInPow) }
    }
    
    ///1. Через обычные итерации.
    private func iteratePow(base: Double, power: Int) -> Double {
        precondition(power >= 0)
        if power == 0 { return 1 }
        var p: Double = 1
        for _ in 1...power {
            p *= base
        }
        return p
    }
    
    ///2. Через степень двойки с домножением.
    private func powerOfTwoWithMultiplayingPow(base: Double, power: Int) -> Double {
        precondition(power >= 0)
        if power == 0 { return 1 }
        var binaryPow = 1
        var p = 1.0
        
        while(true){
            ///чтобы сделать первоначальное присваивание:
            if (binaryPow & 1 == 1) { p *= base }
            ///сдвигаем на разряд двойки влево 2^1, 2^2, 2^4 ...
            binaryPow = binaryPow << 1
            p *= p
            ///если следующий сдвиг выходит за рамки степени двойки, то выходим из цикла
            if (binaryPow << 1 >= power) { break }
        }
        for _ in binaryPow+1...power {
            p *= base
        }
        return p
    }

    ///3. Через двоичное разложение показателя степени.
    func sumOfPowsOf2(base: Double, power: Int) -> Double {
        func expBySq(_ y: Double, _ x: Double, _ n: Int) -> Double {
            precondition(n >= 0)
            if n == 0 {
                return y
            } else if n == 1 {
                return y * x
            } else if n.isMultiple(of: 2) { //если n четно
                return expBySq(y, x * x, n / 2)
            } else { // если n - нечетно
                return expBySq(y * x, x * x, (n - 1) / 2)
            }
        }

        return expBySq(1, base, power)
    }
}
