//
//  InsertSort.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 26.02.2021.
//

import Foundation

public func insertSort (_ elements: inout [Int]){
    insertSort(&elements, <)
}

public func insertSort<T> (_ array: inout [T], _ comparison: (T,T) -> Bool)  {
    for index in 1..<array.count {
        var currentIndex = index
        let x = array[index]
        while currentIndex > 0 && comparison(x, array[currentIndex - 1]){
            array[currentIndex] = array[currentIndex - 1]
            currentIndex -= 1
        }
        array[currentIndex] = x
    }
}
