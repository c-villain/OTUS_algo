//
//  Sarah.swift
//  DynamicProgramming
//
//  Created by Alexander Kraev on 17.06.2021.
//

import Foundation

final class Sarah: CustomStringConvertible {
    
    let N, M : Int
    let factor: Int
    var map: [[Bool]] = .init()
    var line: [Int] = .init() //N^3
    var L: [Int] = .init() //N^2
    var R: [Int] = .init() //N^2
    
    init(N: Int, M: Int, factor: Int) {
        self.N = N
        self.M = M
        self.factor = factor
        
        line = .init(repeating: 0, count: N) //N^3
        
        L = .init(repeating: 0, count: N) //N^2
        R = .init(repeating: 0, count: N) //N^2
        
        rand()
    }
    
    private func rand() {
        map = .init(repeating: .init(repeating: false, count: M), count: N)
        for y in 0..<M {
            for x in 0..<N {
                map[x][y] = (Int.random(in: 0..<factor) == 0)
            }
        }
    }
    
    var description: String {
        var string = ""
        for y in 0..<M {
            for x in 0..<N {
                string += String(map[x][y] ? "#" : ".")
            }
            string += "\n"
        }
        return string
    }
    
    func start() {
        let startTime = CFAbsoluteTimeGetCurrent()
        var maxSquare: Int = 0
        for y in 0..<M {
            
            getHeightLine(y) //N^3
            
            getReightRanges() // N^2
            getLeftRanges() // N^2
            
            for x in 0..<N {
//                let square = getSquareAt(x,y) //N^4, N^3
                
                //N^2:
                let height = line[x]
                let width = R[x] - L[x] + 1
                let square = width * height
                
                if maxSquare < square {
                    maxSquare = square
                }
            }
        }
        let end = CFAbsoluteTimeGetCurrent()
        let totalExecutionTime : CFAbsoluteTime = end - startTime
        let totalTimeStr = "\(totalExecutionTime)".replacingOccurrences(of: "e|E", with: " × 10^", options: .regularExpression, range: nil)
        print("Total time: \(totalTimeStr) s for answer: \(maxSquare)")
    }
    
    // N^3
    private func getHeightLine(_ y: Int){
        for x in 0..<N {
            if map[x][y] {
                line[x] = 0
            } else {
                line[x] += 1
            }
        }
    }
    
    // N^2
    private func getReightRanges() {
        let stack: Stack = .init()
        for x in 0..<N {
            while !stack.empty {
                guard let peek = stack.peek() else { break }
                if line[peek] > line[x] {
                    guard let last = stack.pop() else { break }
                    R[last] = x - 1
                } else { break }
            }
            stack.push(x)
        }
        while !stack.empty {
            guard let last = stack.pop() else { break }
            R[last] = N - 1
        }
    }
    
    // N^2
    private func getLeftRanges() {
        let stack: Stack = .init()
        for x in (0..<N).reversed() {
            while !stack.empty {
                guard let peek = stack.peek() else { break }
                if line[peek] > line[x] {
                    guard let last = stack.pop() else { break }
                    L[last] = x + 1
                } else { break }
            }
            stack.push(x)
        }
        while !stack.empty {
            guard let last = stack.pop() else { break }
            L[last] = 0
        }
    }
    
    //N^4, N^3
    private func getSquareAt(_ x: Int, _ y: Int) -> Int {
        var maxSquare: Int = 0
        var minHeight: Int = M
        var width = 1
        while x + width - 1 < N {
//            let height: Int = getHeightAt(x + width - 1, y, minHeight) // N^4
            let height: Int = line[x + width - 1] //N^3
            if (minHeight > height) {
                minHeight = height
            }
            if minHeight == 0 { break }
            let square = width * minHeight
            
            if (maxSquare < square) {
                maxSquare = square
            }
            width += 1
        }
        return maxSquare
    }
    
    private func getHeightAt(_ x: Int, _ y: Int, _ minHeight: Int) -> Int {
        var height: Int = 0
        while (height < minHeight && y - height >= 0 && !map[x][y - height]) {
            height += 1
        }
        return height
    }
}
