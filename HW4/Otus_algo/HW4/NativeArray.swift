//
//  NativeArray.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 19.02.2021.
//

import Foundation

/**
classical implementation of the array from Apple is already self-factor array:
 
from documentation:
 
Every array reserves a specific amount of memory to hold its contents.
 When you add elements to an array and that array begins to exceed its reserved capacity,
 the array allocates a larger region of memory and copies its elements into the new storage.
 
 The new storage is a multiple of the old storage’s size.
 
 This exponential growth strategy means that appending an element happens in constant time, averaging the performance of many append operations.
 Append operations that trigger reallocation have a performance cost, but they occur less and less often as the array grows larger.
*/
struct NativeArray: DynamicArray {
    typealias Item = Int

    var items: [Int]

    init(_ capacity: Int = 1, _ random: Bool = false) {
        items = .init()
        if random {
            items.reserveCapacity(capacity)
            items = (0...capacity-1).map{_ in .random(in: 0...capacity-1)}
        }
    }

    func size() -> Int {
        self.items.count
    }

    func isEmpty() -> Bool {
        return self.size() == 0
    }

    mutating func insert(item: Int) {
        items.append(item)
    }

    mutating func insert(item: Int, index: Int) {
        items.insert(item, at: index)
    }

    func select(index: Int) -> Item {
        items[index]
    }

    mutating func remove() {
        items.removeLast()
    }
    
    mutating func remove(index: Int) {
        items.remove(at: index)
    }
}
