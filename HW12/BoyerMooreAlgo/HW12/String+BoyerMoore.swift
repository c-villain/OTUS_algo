//
//  String+BoyerMoore.swift
//  BoyerMoore
//
//  Created by Alexander Kraev on 03.05.2021.
//

import Foundation

/**
    чтобы можно было вызывать self[index]
 */
extension String {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}


extension String {
    
    /**
     Реализация алгоритма поиска шаблона в строке
     */
    
    // посимвольно с начала строки
    func charByCharFromTheBeginning(for pattern: String) -> Int {
        var t: Int = 0 // text
        let last = pattern.count - 1 // last symbol of pattern index
        while t < self.count - last {
            var p: Int = 0 // pattern

            while p <= last && self[t + p] == pattern[p] {
                p += 1
            }
            if p == pattern.count {
                return t
            }
            t += 1
        }
        return -1
    }
    
    // посимвольно с конца строки
    func charByCharFromTheEnd(for pattern: String) -> Int {
        var t: Int = 0 // text
        let last = pattern.count - 1 // last symbol of pattern index
        while t < self.count - last {
            var p: Int = last // pattern

            while p >= 0 && self[t + p] == pattern[p] {
                p -= 1
            }
            if p == -1 {
                return t
            }
            t += 1
        }
        return -1
    }
    
    
    // Оптимизация: алгоритм Бойера-Мура-Хорспула
    func boyerMooreHorspool(for pattern: String) -> Int {
        let shift: [Int] = createShift(pattern)
        var t: Int = 0 // text
        let last = pattern.count - 1 // last symbol of pattern index
        while t < self.count - last {
            var p: Int = last // pattern

            while p >= 0 && self[t + p] == pattern[p] {
                p -= 1
            }
            if p == -1 {
                return t
            }
            
            if let ascii = self[t + last].asciiValue {
                t += shift[Int(ascii)]
            }
        }
        return -1
    }
    
    // таблица смещений
    private func createShift(_ pattern: String) -> [Int] {
        var shift: [Int] = .init(repeating: pattern.count, count: 256)
        for p in 0..<pattern.count - 1 { // -1 чтобы не включать последний символ и неписать 0 в смещение
            if let ascii = pattern[p].asciiValue {
                shift[Int(ascii)] = pattern.count - p - 1
            }
        }
        return shift
    }
    
    // Оптимизация:алгоритм Бойера-Мура
    func boyerMoore(for pattern: String) -> Int {
        if pattern.count == 0 {
            return 0
        }
        let shift: [Int] = createShift(pattern)
        let suffix: [Int] = createSuffixShift(pattern)
        
        var i = pattern.count - 1
        var j = pattern.count - 1
        
        while (i < self.count) {
            
            while (self[i] == pattern[j]) {
                if (j == 0) {
                    return i
                }
                i -= 1
                j -= 1
            }
            if let ascii = self[i].asciiValue {
                i += max(suffix[pattern.count - 1 - j], shift[Int(ascii)])
                j = pattern.count - 1
            }
            
            
        }
        
        return -1
    }

    /**
         * Makes the jump table based on the scan offset which mismatch occurs.
         * (bad character rule).
         */
    
    func createSuffixShift(_ pattern: String) -> [Int] {
        var table: [Int] = .init(repeating: pattern.count, count: pattern.count)
        var lastPrefixPosition: Int = pattern.count
        
        for p in (1...pattern.count).reversed() {
            if isPrefix(pattern: pattern, p: p) {
                lastPrefixPosition = p
            }
            table[pattern.count - p] = lastPrefixPosition - p + pattern.count
        }
        
        for i in 0..<pattern.count - 1 {
            let slen = suffixLength(pattern: pattern, p: i)
            table[slen] = pattern.count - 1 - i + slen;
        }
        
        return table
    }
        /**
         * Is needle[p:end] a prefix of needle?
         */
    
    func isPrefix(pattern: String, p: Int) -> Bool {
        var i: Int = p
        var j = 0
        while (i < pattern.count) {
            if (pattern[i] != pattern[j]) {
                return false
            }
            i += 1
            j += 1
        }
        return true
    }

        /**
         * Returns the maximum length of the substring ends at p and is a suffix.
         * (good suffix rule)
         */
    func suffixLength(pattern: String, p: Int) -> Int {
        var len = 0
        
        var i: Int = p
        var j = pattern.count - 1
        while (i >= 0 && pattern[i] == pattern[j]) {
            i -= 1
            j -= 1
            len += 1
        }
        return len
    }
}
