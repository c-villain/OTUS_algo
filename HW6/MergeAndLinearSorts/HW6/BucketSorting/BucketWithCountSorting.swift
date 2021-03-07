//
//  BucketWithCountSorting.swift
//  MergeAndLinearSorts
//
//  Created by Alexander Kraev on 07.03.2021.
//

import Foundation

public func uint16_bucketWithCountSort(_ data: inout [Int]) {
    let maxValue = Int(UInt16.max)
    bucketWithCountSort(&data, maxItem: maxValue)
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
public func bucketWithCountSort(_ data: inout [Int], maxItem: Int? = nil) {
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
