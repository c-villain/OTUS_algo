//
//  PriorityQueue.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 22.02.2021.
//

import Foundation

protocol PriorityQueueProtocol {
    associatedtype Item
    
    func size() -> Int
    
    ///поместить элемент в очередь
    mutating func enqueue(priority: Int, item: Item)
    
    ///выбрать элемент из очереди
    mutating func dequeue() -> Item?
}

struct PriorityQueue<Element>: PriorityQueueProtocol {
    
    typealias Item = Element
    
    var items = [(priority: Int, item: Element)]()
    
    func size() -> Int {
        items.count
    }
    
    mutating func enqueue(priority: Int, item: Element) {
        items.append((priority, item))
        items = items.sorted(by: {
            $0.priority < $1.priority
        })
    }
    
    mutating func dequeue() -> Element? {
        items.removeLast().item
    }
}
