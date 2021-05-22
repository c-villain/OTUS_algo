//
//  PriorityQueue.swift
//  Huffman
//
//  Created by Alexander Kraev on 22.05.2021.
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

// MARK: Priority queue
final class PriorityQueue<Element>: PriorityQueueProtocol {
    
    typealias Item = Element

    var items: [(priority: Int, item: Queue<Element>)] = .init()
    
    func size() -> Int {
        var size = 0
        for item in items {
            size += item.item.size()
        }
        return size
    }
    
    func enqueue(priority: Int, item: Element) {
        if items.first(where: {$0.priority == priority}) == nil {
            let item: (priority: Int, item: Queue<Element>) = (priority: priority, .init())
            items.append(item)
        }
        guard let index = items.firstIndex(where: {$0.priority == priority}) else {
            print("Error")
            return
        }
        items[index].item.enqueue(item)
        
        // sorting:
        items = items.sorted { $0.0 < $1.0 }
    }
    
    func dequeue() -> Element? {
        for item in items {
            if (item.item.size() > 0) {
                return item.item.dequeue()
            }
        }
        return nil
    }
}

final class Queue<T> {
    private var elements: [T] = []
    
    func enqueue(_ value: T) {
        elements.append(value)
    }
    
    func size() -> Int {
        elements.count
    }
    
    func dequeue() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeFirst()
    }
}
