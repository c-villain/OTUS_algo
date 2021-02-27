//
//  HeapSort.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 27.02.2021.
//

import Foundation

public func heapSort<Int> (_ elements: inout [Int]) where Int: Comparable {
    heapSort(&elements, <)
}

public func heapSort<T> (_ array: inout [T], _ comparison: (T,T) -> Bool)  {
    
    if (array.count == 1) { return }
        
    func moveMaxToRoot(_ root: Int, _ size: Int) {
        
        let L: Int = 2 * root + 1
        let R: Int = L + 1
        var X: Int = root
        
        if L < size && comparison(array[X], array[L]) { X = L}
        if R < size && comparison(array[X], array[R]) { X = R}
        
        if (X == root) { return }
        array.swapAt(root, X)
        moveMaxToRoot(X, size)
    }
    
    // array.count/2 - 1) - первый элемент, у которого есть потомок в дереве
    for root in (0...array.count/2 - 1).reversed() {
        moveMaxToRoot(root, array.count) //array[root] == MAX
    }
    
    //array[0] == MAX
    for j in (0...array.count - 1).reversed() { //start of sorted part
        array.swapAt(0, j) //max => array[LAST]
        moveMaxToRoot(0, j)
    }
}
