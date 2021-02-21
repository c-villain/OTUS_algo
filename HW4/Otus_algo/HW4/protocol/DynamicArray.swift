//
//  DynamicArray.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 16.02.2021.
//

import Foundation

protocol DynamicArray {
    associatedtype Item
    
    /// current size of array
    func size() -> Int
    
    /// check if current array is non empty
    func isEmpty() -> Bool
    
    /// insert item to the end of array
    mutating func insert(item: Item)
    
    /// insert item to the position with index
    mutating func insert(item: Item, index: Int)
    
    /// select item on position with index
    func select(index: Int) -> Item
    
    /// insert last item of array
    mutating func remove()
    
    /// remove item from position with index
    mutating func remove(index: Int)
}
