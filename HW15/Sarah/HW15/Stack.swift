//
//  Stack.swift
//  DynamicProgramming
//
//  Created by Alexander Kraev on 18.06.2021.
//

import Foundation

final class Stack {
    var arr: [Int] = .init()
    
    var empty: Bool {
        arr.count == 0
    }
    
    public func push(_ x: Int) {
        arr.append(x)
    }
    
    public func pop() -> Int? {
        arr.popLast()
    }
    
    public func peek() -> Int? {
        arr.last
    }
}
