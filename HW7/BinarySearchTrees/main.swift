//
//  main.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 06.02.2021.
//

import Foundation



///HW7

let numOfElements = 3_000

print("BST:")
print("creating random BST:")
let randromTree = testForCreatingBST(numOfElements: numOfElements, type: .randomBST)
print("___________________")
print("test searching in random BST:")
testForSearchingElements(tree: randromTree, maxElementInTree: 65535, numOfSearchingElements: numOfElements/10)
print("___________________")
print("test removing in random BST:")
testForRemovingElements(tree: randromTree, maxElementInTree: 65535, numOfSearchingElements: numOfElements/10)

print("___________________")
print("creating increasing BST:")
let increasingTree = testForCreatingBST(numOfElements: numOfElements, type: .increasingBST)
print("___________________")
print("test searching in increasing BST:")
testForSearchingElements(tree: increasingTree, maxElementInTree: numOfElements-1, numOfSearchingElements: numOfElements/10)
print("___________________")
print("test removing in increasing BST:")
testForRemovingElements(tree: increasingTree, maxElementInTree: numOfElements-1, numOfSearchingElements: numOfElements/10)
print("___________________")

print("BALANCED BST:")
print("creating random balanced BST:")
let randromBalancedTree = testForCreatingBST(numOfElements: numOfElements, type: .randomBalancedBST)
print("___________________")
print("test searching in random balanced BST:")
testForSearchingElements(tree: randromBalancedTree, maxElementInTree: 65535, numOfSearchingElements: numOfElements/10)
print("___________________")
print("test removing in random balanced BST:")
testForRemovingElements(tree: randromBalancedTree, maxElementInTree: 65535, numOfSearchingElements: numOfElements/10)

print("___________________")
print("creating increasing balanced BST:")
let increasingBalancedTree = testForCreatingBST(numOfElements: numOfElements, type: .increasingBalancedBST)
print("___________________")
print("test searching in increasing balanced BST:")
testForSearchingElements(tree: increasingBalancedTree, maxElementInTree: numOfElements-1, numOfSearchingElements: numOfElements/10)
print("___________________")
print("test removing in increasing balanced BST:")
testForRemovingElements(tree: increasingBalancedTree, maxElementInTree: numOfElements-1, numOfSearchingElements: numOfElements/10)
print("___________________")


    /**

//let tree = BST<Int>(7)
//tree.insert(2)
//tree.insert(5)
//tree.insert(10)
//tree.insert(9)
//tree.insert(1)
//tree.insert(1)
//tree.insert(1)
//tree.insert(10)
//tree.insert(2)
//tree.insert(8)
//tree.insert(12)
//tree.insert(14)
//tree.insert(15)
//print(tree)
//print(tree.searchNode(7)?.height)
//print(tree.searchNode(2)?.height)
//print(tree.searchNode(10)?.height)


//проверка малогого правого поворота
//let tree = BST<Int>(80)
//tree.insert(50)
//tree.insert(90)
//tree.insert(40)
//tree.insert(60)
//tree.insert(61)
//tree.insert(30)
//tree.insert(20)
//print(tree)
//print(tree.isTreeBalanced())
//print(tree.smallRightRotation())
//print(tree)
//print(tree.isTreeBalanced())

//проверка малого левого поворота:
//let tree = BST<Int>(50)
//tree.insert(70)
//tree.insert(40)
//tree.insert(80)
//tree.insert(90)
//tree.insert(65)
//tree.insert(60)
//print(tree)
//print(tree.isTreeBalanced())
//print(tree.smallLeftRotation())
//print(tree)
//print(tree.isTreeBalanced())


//проверка большого правого поворота
//let tree = BST<Int>(80)
//tree.insert(50)
//tree.insert(70)
//tree.insert(60)
//tree.insert(55)
//tree.insert(74)
//tree.insert(75)
//tree.insert(20)
//tree.insert(30)
//tree.insert(90)
//tree.insert(95)
//print(tree)
//print(tree.isTreeBalanced())
//print(tree.bigRightRotation())
//print(tree)
//print(tree.isTreeBalanced())

//проверка функции балансировки
//let tree = BST<Int>(70)
//tree.insert(60)
//tree.insert(80)
//tree.insert(65)
//tree.insert(50)
//tree.insert(40)
//tree.insert(30)
//tree.insert(90)
//tree.insert(100)
//tree.insert(85)
//tree.insert(84)
//tree.insert(83)
//tree.insert(82)
//print(tree)
//print(tree.isTreeBalanced())
//print(tree.rebalance() )
//print(tree)
//print(tree.isTreeBalanced())

//let treeArray = BST<Int>([6,12,78,3,56,14,9,0,6,12,15])
//print(treeArray)
//print("________")
//treeArray.remove(56)
//print("removing 56...")
//print(treeArray)
//print("________")
//treeArray.remove(12)
//print("removing 12...")
//print(treeArray)
//print("________")
//print(treeArray.search(78))
//treeArray.remove(78)
//print("removing 78...")
//print(treeArray)
//print(treeArray.search(78))
//print(treeArray.search(12))
//print(treeArray.search(66))
//print(treeArray.search(77))
//print(treeArray.search(56))
//print(treeArray.search(15))
//print(treeArray.search(56))
//print(treeArray.search(1))
//print(treeArray.search(0))

//тест вставки последовательных элементов в обычное дерево
//let tree = BST<Int>(1)
//tree.insert(2)
//tree.insert(3)
//tree.insert(4)
//tree.insert(5)
//tree.insert(6)
//tree.insert(7)
//tree.insert(8)
//tree.insert(9)
//tree.insert(10)
//tree.insert(11)
//print(tree)

//тест вставки последовательных элементов в сбаласированное дерево
//let tree = BST<Int>(1)
//tree.insertInBalancedTree(2)
//tree.insertInBalancedTree(3)
//tree.insertInBalancedTree(4)
//tree.insertInBalancedTree(5)
//tree.insertInBalancedTree(6)
//tree.insertInBalancedTree(7)
//tree.insertInBalancedTree(8)
//tree.insertInBalancedTree(9)
//tree.insertInBalancedTree(10)
//tree.insertInBalancedTree(11)
//print(tree)

*/



enum NumType {
    case randomBST
    case increasingBST
    case randomBalancedBST
    case increasingBalancedBST
}

func testForCreatingBST(numOfElements: Int, type: NumType) -> BST<Int> {
    let start = CFAbsoluteTimeGetCurrent()
    var tree: BST<Int>
    switch type {
    case .randomBST:
        tree = createRandomBST(numOfElements: numOfElements)
    case .increasingBST:
        tree = createIncreasingBST(numOfElements: numOfElements)
    case .randomBalancedBST:
        tree = createRandomBalancedBST(numOfElements: numOfElements)
    case .increasingBalancedBST:
        tree = createIncreasingBalancedBST(numOfElements: numOfElements)
    }
    let end = CFAbsoluteTimeGetCurrent()
    let totalExecutionTime : CFAbsoluteTime = end - start
    let totalTimeStr = "\(totalExecutionTime)".replacingOccurrences(of: "e|E", with: " × 10^", options: .regularExpression, range: nil)
    print("Total time for creating BST: \(totalTimeStr)s")
    return tree
}

func createRandomBST(numOfElements: Int) -> BST<Int> {
    let tree = BST<Int>(Int.random(in: 0...65535))
    for _ in 0..<numOfElements-1 {
        tree.insert(Int.random(in: 0...65535))
    }
    return tree
}

func createRandomBalancedBST(numOfElements: Int) -> BST<Int> {
    let tree = BST<Int>(Int.random(in: 0...65535))
    for _ in 0..<numOfElements-1 {
        tree.insertInBalancedTree(Int.random(in: 0...65535))
    }
    return tree
}

func createIncreasingBST(numOfElements: Int) -> BST<Int> {
    let tree = BST<Int>(0)
    for index in 1..<numOfElements {
        tree.insert(index)
    }
    return tree
}

func createIncreasingBalancedBST(numOfElements: Int) -> BST<Int> {
    let tree = BST<Int>(0)
    for index in 1..<numOfElements {
        tree.insertInBalancedTree(index)
    }
    return tree
}

func testForSearchingElements(tree: BST<Int>, maxElementInTree: Int, numOfSearchingElements: Int) {
    let start = CFAbsoluteTimeGetCurrent()
    for _ in 0..<numOfElements-1 {
        tree.search(Int.random(in: 0...maxElementInTree))
    }
    let end = CFAbsoluteTimeGetCurrent()
    let totalExecutionTime : CFAbsoluteTime = end - start
    let totalTimeStr = "\(totalExecutionTime)".replacingOccurrences(of: "e|E", with: " × 10^", options: .regularExpression, range: nil)
    print("Total time for searching in BST: \(totalTimeStr)s")
}

func testForRemovingElements(tree: BST<Int>, maxElementInTree: Int, numOfSearchingElements: Int) {
    let start = CFAbsoluteTimeGetCurrent()
    for _ in 0..<numOfElements-1 {
        tree.remove(Int.random(in: 0...maxElementInTree))
    }
    let end = CFAbsoluteTimeGetCurrent()
    let totalExecutionTime : CFAbsoluteTime = end - start
    let totalTimeStr = "\(totalExecutionTime)".replacingOccurrences(of: "e|E", with: " × 10^", options: .regularExpression, range: nil)
    print("Total time for searching in BST: \(totalTimeStr)s")
}
