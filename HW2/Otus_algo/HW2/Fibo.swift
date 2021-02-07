//
//  Fibo.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 07.02.2021.
//

import Foundation
import BigInt

class Fibo: Task{
    
    private var type: algoType
    init(_ type: algoType) {
        self.type = type
    }
    
    enum algoType {
        case recursive
        case iterate
        case goldenRatio
        case matrix
    }
    
    func run(_ data: [String]) -> String {
        let n = (data[0] as NSString).integerValue
        var Fn: BigInt
        
        switch type {
        case .recursive:
            Fn = recursive(n)
        case .iterate:
            Fn = iterate(n)
        case .goldenRatio:
            Fn = goldenRatio(n)
        case .matrix:
            Fn = matrix(n)
        }
        return String("\(Fn)")
    }
 
    ///4a. Через рекурсию
    private func recursive(_ n: Int) -> BigInt {
        if n == 0 { return 0 }
        if n == 1 { return 1 }
        return BigInt(recursive(n - 2) + recursive(n - 1))
    }
    
    ///4b. Через итерацию
    private func iterate(_ n: Int) -> BigInt {
        if n == 0 { return 0}
        if n == 1 { return 1}
        var f0: BigInt = 0
        var f1: BigInt = 1
        var f2: BigInt = 1
        for _ in 2...n {
            f2 = f0 + f1
            f0 = f1
            f1 = f2
        }
        return BigInt(f2)
    }
    
    ///4c. По формуле золотого сечения
    private func goldenRatio(_ n: Int) -> BigInt {
        let ratio: Double = (1 + pow(5, 1/2) ) / 2
        
        //floor - целая часть
        let Fn = floor( (pow(ratio, Double(n)) / pow(5, 1/2)) + 0.5 )
        
        return BigInt(Fn)
    }
    
    ///4d. Через умножение матриц
    private func matrix(_ n: Int) -> BigInt {
        var M: [[BigInt]] = [[1, 1], [1, 0]]
        if n == 0 { return 0 }
        if n == 1 { return 1 }
        power(&M, n - 1)
        return M[0][0]
    }
    
    private func power(_ matrix: inout [[BigInt]], _ n: Int) {
        guard n > 1 else { return }
        power(&matrix, n/2)
        multiply(&matrix, matrix)
        if n % 2 != 0 {
            let M: [[BigInt]] = [[1, 1], [1, 0]]
            multiply(&matrix, M)
        }
    }
    
    /// функция перемножающая две матрицы размером 2х2
    private func multiply(_ F: inout [[BigInt]],_ M: [[BigInt]]) {
        let x = F[0][0]*M[0][0] + F[0][1]*M[1][0]
        let y = F[0][0]*M[0][1] + F[0][1]*M[1][1]
        let z = F[1][0]*M[0][0] + F[1][1]*M[1][0]
        let w = F[1][0]*M[0][1] + F[1][1]*M[1][1]
        
        F[0][0] = x
        F[0][1] = y
        F[1][0] = z
        F[1][1] = w
    }
}
