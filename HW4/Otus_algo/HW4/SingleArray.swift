//
//  SingleArray.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 18.02.2021.
//

import Foundation

struct SingleArray: DynamicArray {
    
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
        /// увеличиваем мощность массива на единицу для вставляемого элемента:
        items.reserveCapacity(size() + 1)
    }
    
    private mutating func decreaseSize(){
        /// увеличиваем мощность массива на единицу для вставляемого элемента:
        items.reserveCapacity(size() - 1)
    }
    
    
}

/**
 struct SingleArray: DynamicArray {
     typealias Item = Int
     
     var items: [Int]
     
     init(_ capacity: Int = 1, _ random: Bool = false) {
         items = .init(repeating: .zero, count: capacity)
         if random { items = items.map{_ in .random(in: 1...capacity)} }
     }
     
     func size() -> Int {
         self.items.count
     }
     
     func isEmpty() -> Bool {
         return self.size() == 0
     }
     
     /// insert item to the end of array
     mutating func insert(item: Int) {
         insert(item: item, index: size() + 1)
     }
     
     mutating func insert(item: Int, index: Int) {
         /// индекс с учетом коррекции:
         /// поставить на "второе" место значит items[1]...
         let correctIndex = index - 1
         var newArray: [Int] = .init(repeating: .zero, count: size() + 1)
         if (correctIndex > 0) { for inx in 0...correctIndex - 1 { newArray[inx] = items[inx] } }
         newArray[correctIndex] = item
         if correctIndex < size() - 1 {
             for inx in correctIndex + 1...size() { newArray[inx] = items[inx - 1] }
         }
         items = newArray
     }
     
     func select(index: Int) -> Int {
         items[index]
     }
     
     mutating func remove(index: Int) {
         /// индекс с учетом коррекции:
         /// поставить на "второе" место значит items[1]...
         let correctIndex = index - 1
         var newArray: [Int] = .init(repeating: .zero, count: size() - 1)
         if (correctIndex > 0) {
             for inx in 0...correctIndex - 1 { newArray[inx] = items[inx] } //copy 0...index-1 item
         }
         if (correctIndex < size() - 1) {
             for inx in correctIndex+1...size()-1 { newArray[inx - 1] = items[inx] } // copy index+1...end item
         }
         items = newArray
     }
     
 }
 */



