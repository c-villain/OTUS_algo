//
//  BST.swift
//  BinarySearchTrees
//
//  Created by Alexander Kraev on 10.03.2021.
//

import Foundation

protocol Node {
    associatedtype Item
    func insert(_ item: Item)         // вставка элемента
    func remove(_ item: Item)         // удаление элемента
    func search(_ item: Item) -> Bool // поиск элемента
}

/**
    Реализация бинарного дерева поиска.
    Binary Search Tree (BST) implementation.
 */

class BST<T: Comparable>: Node, Equatable {
    
    static func == (lhs: BST<T>, rhs: BST<T>) -> Bool {
        guard let leftRoots = lhs.keys, let rightRoots = rhs.keys else {
            return false
        }
        return leftRoots[0] == rightRoots[0]
    }
    
    var left: BST? //левое дерево
    var right: BST? //правое дерево
    var keys: [T]? //список одиннаковых элементов
    
    var parent: BST? //родительское дерево
    
    init(_ value: T) {
        keys = .init()
        keys?.append(value)
    }
    
    public convenience init(_ array: [T]) {
        precondition(array.count > 0)
        self.init(array.first!)
        for item in array.dropFirst() {
            insert(item)
        }
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasOnlyLeftChild: Bool {
        return left != nil && right == nil
    }
    
    public var hasOnlyRightChild: Bool {
        return right != nil && left == nil
    }
    
    public var hasOnlyOneChild: Bool {
        return hasOnlyLeftChild || hasOnlyRightChild
    }
    
    func insert(_ item: T) {
        guard let root = self.keys, root.count > 0 else {
            self.keys?.append(item)
            return
        }
        
        /// если элемент для вставки равен ключу в текущем дереве,
        /// то добавляем его в список ключей текущего дерева:
        
        if item == root[0] {
            self.keys?.append(item)
            return
        }
        
        /// если элемент для вставки меньше ключа в текущем дереве,
        /// то помещаем его в левое дерево,
        /// иначе в правое
        
        if item < root[0] {
            if let left = left {
                left.insert(item)
            } else {
                left = BST(item) // init new BST for leaf
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(item)
            } else {
                right = BST(item)
                right?.parent = self
            }
        }
    }
    
    public func minimum() -> BST {
       var node = self
       while let next = node.left {
         node = next
       }
       return node
     }

     public func maximum() -> BST {
       var node = self
       while let next = node.right {
         node = next
       }
       return node
     }
    
    private func reconnectParentTo(node: BST?) {
        if let parent = parent {
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        node?.parent = parent
    }
    
    
    func remove(_ item: T) {
        guard let nodeToRemove = searchNode(item) else { return }

        let replacement: BST?
        
        // Replacement for node can be either biggest one on the left or
        // smallest one on the right, whichever is not nil
        if let right = nodeToRemove.right {
            replacement = right.minimum()
        } else if let left = nodeToRemove.left {
            replacement = left.maximum()
        } else {
            replacement = nil
        }
        
        if let keyOfReplacement = replacement?.keys {
            remove(keyOfReplacement[0])
        }

        // Place the replacement on current node's position
        replacement?.right = nodeToRemove.right
        replacement?.left = nodeToRemove.left
        replacement?.parent = nodeToRemove.parent
        nodeToRemove.right?.parent = replacement
        nodeToRemove.left?.parent = replacement
        nodeToRemove.reconnectParentTo(node: replacement)
        
        // The current node is no longer part of the tree, so clean it up.
        nodeToRemove.parent = nil
        nodeToRemove.left = nil
        nodeToRemove.right = nil
    }
    
    func search(_ item: T) -> Bool {
        return searchNode(item) != nil
    }
    
    func searchNode(_ item: T) -> BST? {
        guard let root = self.keys else { return nil }
        
        if item < root[0] {
            return left?.searchNode(item)
        }
        else if item > root[0] {
            return right?.searchNode(item)
        }
        else if item == root[0] {
            return self
        }
        return nil
    }
    
}


// for debug information:
extension BST: CustomStringConvertible {
  public var description: String {
    var s = ""
    if let left = left {
      s += "(\(left.description)) <- "
    }

    if let roots = keys {
        roots.enumerated().forEach { index, item in
            s += "\(item)"
            if index < roots.count - 1 {
                s += ","
            }
        }
    }
    
    if let right = right {
      s += " -> (\(right.description))"
    }
    return s
  }
}
