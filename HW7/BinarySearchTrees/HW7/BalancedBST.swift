//
//  BalancedBST.swift
//  BinarySearchTrees
//
//  Created by Alexander Kraev on 12.03.2021.
//

import Foundation

// for balancing:
extension BST {
    
    // высота узла:
    public var height: Int {
        return max(left?.height ?? 0, right?.height ?? 0) + 1
    }
    
    // определяем сбалансирован ли рут
    func isRootBalanced() -> Bool {
        // проверка рута, если его нет, то по-умолч. сбалансировано
        if (self.keys == nil) { return true }

        if (abs((self.left?.height ?? 0) - (self.right?.height ?? 0) ) <= 1) {
            return true
        }
        else {
            return false
        }
    }
    
    // определяем сбалансировано ли все дерево:
    func isTreeBalanced() -> Bool {
        
        func isNodeBalanced(node: BST?) -> Bool {
            // проверка рута, если его нет, то по-умолч. сбалансировано
            if (node?.keys == nil) { return true }
            
            if (abs((node?.left?.height ?? 0) - (node?.right?.height ?? 0) ) <= 1) {
                return true
            }
            else {
                return false
            }
        }
        
        func AreChildrenBalanced(of node: BST?) -> Bool {
            if (node?.keys == nil) { return true }
            
            let nodeBalanced = isNodeBalanced(node: node)
            let nodeRightBalanced = isNodeBalanced(node: node?.right)
            let nodeLeftBalanced = isNodeBalanced(node: node?.left)
            var nodeRightChildBalanced = true
            if let nodeRight = node?.right {
                nodeRightChildBalanced = nodeRight.isTreeBalanced()
            }
            
            var nodeLeftChildBalanced = true
            if let nodeLeft = node?.left {
                nodeLeftChildBalanced = nodeLeft.isTreeBalanced()
            }
            
            return nodeBalanced && nodeRightBalanced && nodeLeftBalanced && nodeRightChildBalanced && nodeLeftChildBalanced
        }
        
        return AreChildrenBalanced(of: self)
    }
    
    // малый правый поворот:
    func smallRightRotation() {
        //если рута нет, то сразу выходим:
        guard let roots = self.keys else { return }
        
        //если дерево сбалансировано, то выходим, поворот делать не за чем:
//        if self.isBalanced() { return }
        //если левого сына нет, также выходим, так как поворот делать нечем:
        if self.left == nil { return }
        
        // Условия для вращения:
        //1. Если в принципе это уместно делать: если вес левого сына больше веса правого сына:
        guard (self.left?.height ?? 0) - (self.right?.height ?? 0) >= 1 else { return }
        //2. Вес левого внука больше или равен веса правого внука у левого сына
        // (иначе проблема изначального разбаласирования не решается)
        guard self.left?.left?.height ?? 0 >= self.left?.right?.height ?? 0 else { return }
        
        
        let replacement: BST = BST(roots) // временно запоминаем текущий вид дерева
        replacement.left = self.left
        replacement.right = self.right
        
        self.keys = replacement.left?.keys //рутом делаем левого сына
    
        self.right = BST(roots) //правым сыном делаем прошлый корень
        self.right?.parent = self
        
        self.right?.right = replacement.right //перемещаем правого сына на новое правое место прошлого рута
        self.right?.right?.parent = self.right
        
        self.left = replacement.left?.left
        self.left?.parent = self
        
        self.right?.left = replacement.left?.right
        self.right?.left?.parent = self.right
    }
    
    // малый левый поворот:
    func smallLeftRotation() {
        //если рута нет, то сразу выходим:
        guard let roots = self.keys else { return }

        //если дерево сбалансировано, то выходим, поворот делать не за чем:
//        if self.isBalanced() { return }
        //если правого сына нет, также выходим, так как поворот делать нечем:
        if self.right == nil { return }

        // Условия для вращения:
        //1. Если в принципе это уместно делать: если вес правого сына больше веса левого сына:
        guard (self.right?.height ?? 0) - (self.left?.height ?? 0) >= 1 else { return }
        //2. Вес правого внука больше или равен веса левого внука у ппавого сына
        // (иначе проблема изначального разбаласирования не решается)
        guard self.right?.right?.height ?? 0 >= self.right?.left?.height ?? 0 else { return }
        
        let replacement: BST = BST(roots) // временно запоминаем текущий вид дерева
        replacement.left = self.left
        replacement.right = self.right

        self.keys = replacement.right?.keys //рутом делаем правого сына

        self.left = BST(roots) //левым сыном делаем прошлый корень
        self.left?.parent = self

        //перемещаем левого сына на новое левое место сына прошлого рута
        //так как он все равно меньше всех, то его позиция и не меняется
        self.left?.left = replacement.left
        self.left?.left?.parent = self.left

        //крайний правый сын у правого корня старого рута также становится справа
        // так как он больше всех остальных:
        self.right = replacement.right?.right
        self.right?.parent = self

        //тот сын который был между правым корнем рута и рутом,
        // теперь будет между левым корнем (пролым рутом) нового рута и новым рутом:
        self.left?.right = replacement.right?.left
        self.left?.right?.parent = self.left
    }
    
    // большое левое вращение
    // выполняется тогда, когда невозможно сделать малый правый поворот по причине
    // того, что вес в правом сыне у левого внука больше, чем у правого внука:
    func bigLeftRotation() {
        //если рута нет, то сразу выходим:
        guard (self.keys != nil) else { return }
        
        //если рут сбалансирован, то выходим, поворот делать не за чем:
        if self.isRootBalanced(){ return }
        //если левого сына нет, также выходим, так как поворот делать нечем:
        if self.right == nil { return }
        
        // Условия для вращения:
        // Если в принципе это уместно делать: если вес левого сына больше веса правого сына более, чем на 1:
        guard (self.right?.height ?? 0) - (self.left?.height ?? 0) > 1 else { return }
        
        // главное условие для выполнения малого левого поворота:
        // если веса у внуков правого сына неподходящие:
        if self.right?.right?.height ?? 0 < self.right?.left?.height ?? 0 {
            self.right?.smallRightRotation()
        }
        //после выполняем малое левое вращение:
        self.smallLeftRotation()
    }
    
    // большое правое вращение
    // выполняется тогда, когда невозможно сделать малый правый поворот по причине
    // того, что вес в левом сыне у правого внука больше, чем у левого внука:
    func bigRightRotation(){
        //если рута нет, то сразу выходим:
        guard (self.keys != nil) else { return }
        
        //если рут сбалансирован, то выходим, поворот делать не за чем:
        if self.isRootBalanced() { return }
        //если левого сына нет, также выходим, так как поворот делать нечем:
        if self.left == nil { return }
        
        // Условия для вращения:
        // Если в принципе это уместно делать: если вес левого сына больше веса правого сына более, чем на 1:
        guard (self.left?.height ?? 0) - (self.right?.height ?? 0) > 1 else { return }
        
        // главное условие для выполнения малого левого поворота:
        // если веса у внуков левого сына неподходящие:
        if self.left?.left?.height ?? 0 < self.left?.right?.height ?? 0 {
            self.left?.smallLeftRotation()
        }
        //после выполняем малое правое вращение:
        self.smallRightRotation()
    }
    
    // перебалансировка дерева
    func rebalance() {
        
        func rotate(node: BST?) {
            guard let node = node else { return }
            
            // если рута нет, то сразу выходим:
            guard (node.keys != nil) else { return }
            
            // если дерево сбалансировано, то выходим, поворот делать не за чем:
            if node.isTreeBalanced() { return }
            
            // дальше выясняем какой поворот нам делать:
            // или правый
            if (node.left?.height ?? 0) - (node.right?.height ?? 0) > 1 {
                node.bigRightRotation()
            }
            // или левый
            if (node.right?.height ?? 0) - (node.left?.height ?? 0) > 1 {
                node.bigLeftRotation()
            }
        }
        
        func rebalanceNode(node: BST?) {
            rotate(node: node)
            node?.right?.rebalance()
            node?.left?.rebalance()
        }
        
        rebalanceNode(node: self)
    }
 
    // вставка элемента в сбалансированное дерево:
    func insertInBalancedTree(_ item: T){
        self.insert(item)
        self.rebalance()
    }
    
    // удаление элемента из сбалансированного дерева:
    func removeFromBalancedTree(_ item: T){
        self.remove(item)
        self.rebalance()
    }
}


