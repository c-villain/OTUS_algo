//
//  BucketWithHeapSorting.swift
//  MergeAndLinearSorts
//
//  Created by Alexander Kraev on 07.03.2021.
//

import Foundation

public func uint16_bucketWithHeapSort(_ data: inout [Int]) {
    let maxValue = Int(UInt16.max)
    bucketWithHeapSort(&data, maxItem: maxValue)
}

public func bucketWithHeapSort(_ data: inout [Int], maxItem: Int? = nil) {
    let count = data.count
    guard count > 0 else { return }
    
    // если не знаем макс элемент, то ищем самостотельно:
    let max: Int = (maxItem == nil) ? data.max()! : maxItem!
    var buckets = [HeapBucket](repeating: HeapBucket(), count: count)
    var out = [Int]()
    
    for i in 0..<data.count {
        let data_i: Int = data[i] * count / (max + 1)
        buckets[data_i].add(item: data[i]) //заполняем корзину i-ым элементом массива
    }

    buckets.enumerated().forEach { index, bucket in
        guard bucket.count > 0 else { return }
        buckets[index].sort() //сортируем внутри корзины
        out.append(contentsOf: buckets[index].elements)
    }
    
    data = out
}

public struct HeapBucket {
    var elements: [Int]

    var count: Int {
        return elements.count
    }
    
    public init() {
        elements = [Int]()
    }

    public mutating func add(item: Int) {
        elements.append(item)
    }

    public mutating func sort(){
        heapSort(&elements)
    }
}
