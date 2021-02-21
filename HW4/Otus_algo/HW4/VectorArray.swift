//
//  VectorArray.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 21.02.2021.
//

import Foundation

struct VectorArray: DynamicArray {
    
    typealias Item = Int
    
    var delta: Int = 10
    
    var items: [Int]
    
    init(_ capacity: Int = 1, _ random: Bool = false) {
        items = .init()
        if random {
            items.reserveCapacity(capacity)
            items = (0...capacity-1).map{_ in .random(in: 0...capacity-1)}
        }
    }
    
    func size() -> Int {
        return items.count
    }
    
    func isEmpty() -> Bool {
        return size() == 0
    }
    
    mutating func insert(item: Int) {
        increaseSize()
        items.append(item)
    }
    
    mutating func insert(item: Int, index: Int) {
        increaseSize()
        items.insert(item, at: index)
    }
    
    func select(index: Int) -> Int {
        items[index]
    }
    
    mutating func remove() {
        items.removeLast()
        decreaseSize()
    }
    
    mutating func remove(index: Int) {
        items.remove(at: index)
        decreaseSize()
    }
    
    private mutating func increaseSize(){
        /// увеличиваем мощность массива на дельту, если выходим за пределы размера:
        if size() < items.capacity { return }
        items.reserveCapacity( size() + delta)
    }
    
    private mutating func decreaseSize(){
        /// увеличиваем мощность массива на единицу для вставляемого элемента:
        if (items.capacity < size() + delta) { return }
        items.reserveCapacity(items.capacity - delta)
    }
    
}
