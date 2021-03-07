//
//  ShellSort.swift
//  LinearSorts
//
//  Created by Alexander Kraev on 06.03.2021.
//

import Foundation

public func shellSort<Int> (_ elements: inout [Int]) where Int: Comparable {
    shellSort(&elements, <)
}

public func shellSort<T> (_ array: inout [T], _ comparison: (T,T) -> Bool)  {
    var gap: Int = array.count / 2
    
    while gap > 0 {
        for i in 0..<array.count where i + gap < array.count {
            var currentGapIndex = i + gap
            let x = array[currentGapIndex]
            while currentGapIndex - gap >= 0 && comparison(x, array[currentGapIndex - gap]) {
                array[currentGapIndex] = array[currentGapIndex - gap]
                currentGapIndex -= gap
            }
            array[currentGapIndex] = x
        }
        gap /= 2
    }
}

/// Shell with gap = 2^k - 1: 1, 3, 7, 15, 31, 63,..
///https://oeis.org/A000225

public func hibbardSort<Int> (_ elements: inout [Int]) where Int: Comparable {
    hibbardSort(&elements, <)
}

///https://stackoverflow.com/questions/46946300/shell-sort-using-hibbard-increment
public func hibbardSort<T> (_ array: inout [T], _ comparison: (T,T) -> Bool)  {

    func hibbardSeq(_ capacity: Int) -> [Decimal] {
        var seq = [Decimal]()
        let hSeq = Int(floor(log(Double(capacity+1))/log(2)))
        for i in 0..<hSeq {
            let item = pow(2, i+1) - 1
            seq.append(item)
        }
        return seq
    }

    let seq = hibbardSeq(array.count)
    for j in (0..<seq.count).reversed() {
        let gap = Int.init(truncating: seq[j] as NSNumber )
        for i in 0..<array.count where i + gap < array.count {
            var currentGapIndex = i + gap
            let x = array[currentGapIndex]
            while currentGapIndex - gap >= 0 && comparison(x, array[currentGapIndex - gap]) {
                array[currentGapIndex] = array[currentGapIndex - gap]
                currentGapIndex -= gap
            }
            array[currentGapIndex] = x
        }

    }
}

/// Shell with gap = (3^k - 1)/2 not greater than [N / 3]: 1, 4, 13, 40, 121, ..
///https://oeis.org/A003462
public func knuthSort<Int> (_ elements: inout [Int]) where Int: Comparable {
    knuthSort(&elements, <)
}

public func knuthSort<T> (_ array: inout [T], _ comparison: (T,T) -> Bool)  {

    func knuthSeq(_ capacity: Int) -> [Decimal] {
        var seq = [Decimal]()
        let limit: Int = capacity / 3
        
        for i in 0..<capacity {
            let item = (pow(3, i+1) - 1 ) / 2
            if (Int.init(truncating: item as NSNumber ) <= limit) { seq.append(item) }
            else { break}
        }
        return seq
    }

    let seq = knuthSeq(array.count)
    for j in (0..<seq.count).reversed() {
        let gap = Int.init(truncating: seq[j] as NSNumber )
        for i in 0..<array.count where i + gap < array.count {
            var currentGapIndex = i + gap
            let x = array[currentGapIndex]
            while currentGapIndex - gap >= 0 && comparison(x, array[currentGapIndex - gap]) {
                array[currentGapIndex] = array[currentGapIndex - gap]
                currentGapIndex -= gap
            }
            array[currentGapIndex] = x
        }

    }
}

