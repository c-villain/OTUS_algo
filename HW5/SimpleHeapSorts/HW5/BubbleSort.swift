//
//  BubbleSort.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 25.02.2021.
//

import Foundation

public func bubbleSort<Int> (_ elements: inout [Int]) where Int: Comparable {
    bubbleSort(&elements, <)
}

public func bubbleSort<T> (_ array: inout [T], _ comparison: (T,T) -> Bool)  {
    for i in 0..<array.count {
        for j in 1..<array.count-i {
            if comparison(array[j], array[j-1]) {
                let tmp = array[j-1]
                array[j-1] = array[j]
                array[j] = tmp
            }
        }
    }
}


