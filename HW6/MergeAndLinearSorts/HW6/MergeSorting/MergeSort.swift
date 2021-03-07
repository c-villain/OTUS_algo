//
//  BubbleSort.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 25.02.2021.
//

import Foundation


/// Стандартная реализация алгоритма сортировок слиянием,
/// когда сортировка вырождается в случай сортировки одного элемента
public func mergeSort<Int> (_ elements: inout [Int]) where Int: Comparable {
    mergeSort(&elements, <)
}

public func mergeSort<T> (_ array: inout [T], _ comparison: (T,T) -> Bool)  {

    func sort(_ left: Int,_ right: Int) {
        if left >= right { return }
        let pivot = (left + right) / 2
        sort(left, pivot)
        sort(pivot + 1, right)
        merge(left, pivot, right)
    }
    

    func merge(_ left: Int, _ pivot: Int, _ right: Int){
        var memory = [T]()
        var a = left
        var b = pivot + 1
        var indexInMemoryArray = 0
        while (a <= pivot && b <= right) {
            if comparison(array[a], array[b]) {
                memory.insert(array[a], at: indexInMemoryArray)
                indexInMemoryArray += 1
                a += 1
            } else {
                memory.insert(array[b], at: indexInMemoryArray)
                indexInMemoryArray += 1
                b += 1
            }
        }
        while (a <= pivot) {
            memory.insert(array[a], at: indexInMemoryArray)
            indexInMemoryArray += 1
            a += 1
        }
        
        while (b <= right) {
            memory.insert(array[b], at: indexInMemoryArray)
            indexInMemoryArray += 1
            b += 1
        }
        
        for i in left...right {
            array[i] = memory[i - left]
        }
    }
    
    sort(0, array.count - 1)
 
}


