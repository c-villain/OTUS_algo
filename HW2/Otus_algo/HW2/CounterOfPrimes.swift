//
//  CounterOfPrimes.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 07.02.2021.
//

import Foundation
import BigInt

class CounterOfPrimes: Task {
    
    private var type: algoType
    init(_ type: algoType) {
        self.type = type
    }
    
    enum algoType {
        case devisorEnumerated
        case improvedDevisorEnumerated
        case eratosphen
    }
    
    
    func run(_ data: [String]) -> String {
        let n: BigInt = .init(extendedGraphemeClusterLiteral: data[0])
        var Fn: BigInt
        
        switch type {
        case .devisorEnumerated:
            Fn = devisorEnumerated(for: n)
        case .improvedDevisorEnumerated:
            Fn = improvedDevisorEnumerated(for: n)
        case .eratosphen:
            Fn = eratosphen(for: n)
        }
        return String("\(Fn)")
    }
    
    private func devisorEnumerated(for p: BigInt ) -> BigInt {
        
        func isPrime(_ p: BigInt) -> Bool {
            var q: BigInt = 0
            for d in 1...p {
                if p.isMultiple(of: d) { q += 1 }
            }
            return q == 2
        }
        
        var count: BigInt = 0
        guard p > 1 else { return 0 }
        guard p > 2 else { return 1 }
        for d in 2...p {
            if isPrime(d) { count += 1 }
        }
        return count
    }
    
    private func improvedDevisorEnumerated(for p: BigInt ) -> BigInt {
        
        func isPrime(_ p: BigInt) -> Bool {
            var d: BigInt = 2
            let sqRootOfP = p.squareRoot()
            while d <= sqRootOfP {
                if p.isMultiple(of: d) { return false }
                d += 1
            }
            return true
        }
        
        var count: BigInt = 0
        guard p > 1 else { return 0 }
        guard p > 2 else { return 1 }
        for d in 2...p {
            if isPrime(d) {
                count += 1
            }
        }
        return count
    }
    
    private func eratosphen(for p: BigInt ) -> BigInt {
        
        guard p > 1 else { return 0 }
        guard p > 2 else { return 1 }
        
        var data: [BigInt] = (2...p).map { $0 } // заполняем массив
        var dataCursor: BigInt = 2 // первое простое число
        
        while (dataCursor.powerOf2() <= p) {
            data.removeAll(where: {$0 >= dataCursor.powerOf2() && $0.isMultiple(of: dataCursor)})
            //берем следующий элемент массива в качестве курсора и начинаем вычеркивать от него:
            dataCursor = data.first(where: {$0 > dataCursor})!
        }
        
        return BigInt(data.count) //невычеркнутые элементы массива и есть простые числа
    }
}

extension BigInt {
    func powerOf2() -> BigInt {
        return self * self
    }
}
