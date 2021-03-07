//
//  BucketSort.swift
//  LinearSorts
//
//  Created by Alexander Kraev on 06.03.2021.
//

import Foundation

public func uint16_upgradedBucketSort(_ data: inout [Int]) {
    let maxValue = Int(UInt16.max)
    upgradedBucketSort(&data, maxItem: maxValue)
}

/**
 Так как заранее известна дополнительная информация про сортируемый массив,
 что он состоит из двухбайтных чисел, то можно  улучшить алгоритм
 блочной сортировки алгоритмом подсчета, а именно:
 создаем изначально k+1 блоков, где k - max элемент массива - число 65535.
 После этого в каждый блок, у которого номер - очередной элемент изначального массива,
 попадает число = сколько раз встречается этот очередной элемент, это и есть подсчет.
 После выписываем согласно подсчету отсортированный массив.
 */
public func upgradedBucketSort(_ data: inout [Int], maxItem: Int? = nil) {
    guard data.count > 0 else { return }
    
    // если не знаем макс элемент, то ищем самостотельно:
    let max: Int = (maxItem == nil) ? data.max()! : maxItem!
    var buckets = [Int](repeating: 0, count: (max + 1))
    var out = [Int]()
    
    for i in 0..<data.count {
        buckets[data[i]] = buckets[data[i]] + 1
    }
    
    buckets.enumerated().forEach { index, value in
        guard value > 0 else { return }
        
        out.append(contentsOf: [Int](repeating: index, count: value))
    }
    
    data = out
}

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

public func uint16_bucketSort(_ data: inout [Int]) {
    let maxValue = Int(UInt16.max)
    bucketSort(&data, maxItem: maxValue)
}

public func bucketSort(_ data: inout [Int], maxItem: Int? = nil) {
    let count = data.count
    guard count > 0 else { return }
    
    // если не знаем макс элемент, то ищем самостотельно:
    let max: Int = (maxItem == nil) ? data.max()! : maxItem!
    var buckets = [Bucket](repeating: Bucket(), count: count)
    var out = [Int]()
    
    for i in 0..<data.count {
        let data_i: Int = data[i] * count / (max + 1)
        buckets[data_i].add(item: data[i]) //заполняем корзину i-ым элементом массива
    }

    buckets.enumerated().forEach { index, value in
        guard value.count > 0 else { return }
        out.append(contentsOf: value.elements)
    }
    
    data = out
}

public struct Bucket {
    var elements: [Int]

    var count: Int {
        return elements.count
    }

    public init() {
        elements = [Int]()
    }

    public mutating func add(item: Int) {
        let index = elements.insertionIndexOf(item) { $0 < $1 }
        elements.insert(item, at: index)
    }

    public mutating func sort() {
        return heapSort(&elements)
    }
}

extension Array {
    func insertionIndexOf(_ elem: Element, isOrderedBefore: (Element, Element) -> Bool) -> Int {
        var lo = 0
        var hi = self.count - 1
        while lo <= hi {
            let mid = (lo + hi)/2
            if isOrderedBefore(self[mid], elem) {
                lo = mid + 1
            } else if isOrderedBefore(elem, self[mid]) {
                hi = mid - 1
            } else {
                return mid // found at position mid
            }
        }
        return lo // not found, would be inserted at position lo
    }
}
