//
//  UpgradedMergeSort.swift
//  LinearSorts
//
//  Created by Alexander Kraev on 06.03.2021.
//

import Foundation

/// улучшенный алгоритм сортировки слиянием,
/// когда разделяем исходный массив не до вырожденного массива из одного элемента,
/// а до массива, состоящего из блока элементов, и сортируем его другим алгоритмом  (quick, heap, shell)
public func upgradedMergeSort<Int> (_ elements: inout [Int],
                                    minBlockSize: Swift.Int,
                                    supportedAlgo: @escaping (inout [Int], (Int,Int) -> Bool) -> () ) where Int: Comparable {
    upgradedMergeSort(&elements, minBlockSize, <, supportedAlgo )
}

/// улучшенный алгоритм сортировки слиянием, где блоки из 1024 элементов сортирутся методом Шелла
public func upgradedMergeSortWithShell<Int> (_ elements: inout [Int]) where Int: Comparable {
    upgradedMergeSort(&elements, 1024, <, shellSort )
}

/// улучшенный алгоритм сортировки слиянием, где блоки из 1024 элементов сортирутся пирамидальной сортировкой
public func upgradedMergeSortWithHeap<Int> (_ elements: inout [Int]) where Int: Comparable {
    upgradedMergeSort(&elements, 1024, <, heapSort )
}

public func upgradedMergeSort<T> (_ array: inout [T],
                                  _ minBlockSize: Int,
                                  _ comparison: (T,T) -> Bool,
                                  _ supportedAlgo: @escaping (inout [T], (T,T) -> Bool) -> () )  {

    func sort(_ left: Int,_ right: Int) {
        if right - left <= minBlockSize {
            var memory = [T]()
            for i in left...right {
                memory.insert(array[i], at: i - left)
            }
            supportedAlgo(&memory, comparison)
            for i in left...right {
                array[i] = memory[i - left]
            }
        }
        else {
            let pivot = (left + right) / 2
            sort(left, pivot)
            sort(pivot + 1, right)
            merge(left, pivot, right)
        }
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



