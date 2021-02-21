//
//  main.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 06.02.2021.
//

import Foundation

///HW4

/// Тест вставки в начало массива:
print("SingleArray")
var firstInsertOfSa: SingleArray = .init()
testFirstInsert(&firstInsertOfSa, capacity: 200_000)

print("VectorArray")
var firstInsertOfVa: VectorArray = .init()
testFirstInsert(&firstInsertOfVa, capacity: 200_000)

print("FactorArray")
var firstInsertOfFa: FactorArray = .init()
testFirstInsert(&firstInsertOfFa, capacity: 200_000)

print("NativeArray")
var firstInsertOfNa: NativeArray = .init()
testFirstInsert(&firstInsertOfNa, capacity: 200_000)

/// Тесты вставки элемента в массив на случайную позицию
print("SingleArray")
var randomInsertInSa: SingleArray = .init()
testRandomInsert(&randomInsertInSa, capacity: 200_000)

print("VectorArray")
var randomInsertInVa: VectorArray = .init()
testRandomInsert(&randomInsertInVa, capacity: 200_000)

print("FactorArray")
var randomInsertInFa: FactorArray = .init()
testRandomInsert(&randomInsertInFa, capacity: 200_000)

print("NativeArray")
var randomInsertInNa: NativeArray = .init()
testRandomInsert(&randomInsertInNa, capacity: 200_000)

/// Тесты вставки элемента в конец массива:
print("SingleArray")
var insertToTheEndOfSa: SingleArray = .init()
testInsertToTheEnd(&insertToTheEndOfSa, capacity: 200_000)

print("VectorArray")
var insertToTheEndOfVa: VectorArray = .init()
testInsertToTheEnd(&insertToTheEndOfVa, capacity: 200_000)

print("FactorArray")
var insertToTheEndOfFa: FactorArray = .init()
testInsertToTheEnd(&insertToTheEndOfFa, capacity: 200_000)

print("NativeArray")
var insertToTheEndOfNa: NativeArray = .init()
testInsertToTheEnd(&insertToTheEndOfNa, capacity: 200_000)

/// Тесты чтения первого элемента из массива:
print("SingleArray")
var firstItemReadInSa: SingleArray = .init(200_000, true)
testFirstSelect(&firstItemReadInSa)

print("VectorArray")
var firstItemReadInVa: VectorArray = .init(200_000, true)
testFirstSelect(&firstItemReadInVa)

print("FactorArray")
var firstItemReadInFa: FactorArray = .init(200_000, true)
testFirstSelect(&firstItemReadInFa)

print("NativeArray")
var firstItemReadInNa: NativeArray = .init(200_000, true)
testFirstSelect(&firstItemReadInNa)

/// Тесты чтения элемента на случайной позиции из массива
print("SingleArray")
var randomItemReadInSa: SingleArray = .init(200_000, true)
testRandomSelect(&randomItemReadInSa)

print("VectorArray")
var randomItemReadInVa: VectorArray = .init(200_000, true)
testRandomSelect(&randomItemReadInVa)

print("FactorArray")
var randomItemReadInFa: FactorArray = .init(200_000, true)
testRandomSelect(&randomItemReadInFa)

print("NativeArray")
var randomItemReadInNa: NativeArray = .init(200_000, true)
testRandomSelect(&randomItemReadInNa)

/// Тесты чтения последнего элемента из массива
print("SingleArray")
var lastItemReadInSa: SingleArray = .init(200_000, true)
testLastItemSelect(&lastItemReadInSa)

print("VectorArray")
var lastItemReadInVa: VectorArray = .init(200_000, true)
testRandomSelect(&lastItemReadInVa)

print("FactorArray")
var lastItemReadInFa: FactorArray = .init(200_000, true)
testRandomSelect(&lastItemReadInFa)

print("NativeArray")
var lastItemReadInNa: NativeArray = .init(200_000, true)
testRandomSelect(&lastItemReadInNa)

/// Тест удаления первого элемента из массива
print("SingleArray")
var firstItemRemoveInSa: SingleArray = .init(200_000, true)
testFirstRemove(&firstItemRemoveInSa)

print("VectorArray")
var firstItemRemoveInVa: VectorArray = .init(200_000, true)
testFirstRemove(&firstItemRemoveInVa)

print("FactorArray")
var firstItemRemoveInFa: FactorArray = .init(200_000, true)
testFirstRemove(&firstItemRemoveInFa)

print("NativeArray")
var firstItemRemoveInNa: NativeArray = .init(200_000, true)
testFirstRemove(&firstItemRemoveInNa)

/// Тесты удаления элемента из массива на случайной позиции
print("SingleArray")
var randomRemoveInSa: SingleArray = .init(200_000, true)
testRandomRemove(&randomRemoveInSa)

print("VectorArray")
var randomRemoveInVa: VectorArray = .init(200_000, true)
testRandomRemove(&randomRemoveInVa)

print("FactorArray")
var randomRemoveInFa: FactorArray = .init(200_000, true)
testRandomRemove(&randomRemoveInFa)

print("NativeArray")
var randomRemoveInNa: NativeArray = .init(200_000, true)
testRandomRemove(&randomRemoveInNa)

/// тест удаления последнего элемента из массива
print("SingleArray")
var lastItemRemoveInSa: SingleArray = .init(200_000, true)
testLastItemRemove(&lastItemRemoveInSa)

print("VectorArray")
var lastItemRemoveInVa: VectorArray = .init(200_000, true)
testLastItemRemove(&lastItemRemoveInVa)

print("FactorArray")
var lastItemRemoveInFa: FactorArray = .init(200_000, true)
testLastItemRemove(&lastItemRemoveInFa)

print("NativeArray")
var lastItemRemoveInNa: NativeArray = .init(200_000, true)
testLastItemRemove(&lastItemRemoveInNa)

//Тест приоритетной очереди
var priorityQueue: PriorityQueue<String> = .init()
priorityQueue.enqueue(priority: 0, item: "!")
priorityQueue.enqueue(priority: 0, item: "соревнований")
priorityQueue.enqueue(priority: 1, item: "участникам")
priorityQueue.enqueue(priority: 0, item: "шахматных")
priorityQueue.enqueue(priority: 2, item: "привет")
priorityQueue.enqueue(priority: 1, item: "всем")
priorityQueue.enqueue(priority: 0, item: "💪🏻")
priorityQueue.enqueue(priority: 1, item: "😁")
priorityQueue.enqueue(priority: 2, item: "Огромный")

for _ in 0...priorityQueue.size()-1 {
    print(priorityQueue.dequeue())
}
///-> Огромный привет 😁 всем участникам 💪🏻 шахматных соревнований !


func testFirstSelect<T: DynamicArray >(_ array: inout T) where T.Item == Int {

    let initCapacity = array.size()
    
    printTimeElapsedWhenRunningCode(title: "test first item select", capacity: initCapacity ) {
        _ = array.select(index: 0)
    }
}

func testRandomSelect<T: DynamicArray >(_ array: inout T) where T.Item == Int {
    
    let initCapacity = array.size()
    let rand = Int.random(in: 0...array.size()-1)
    
    printTimeElapsedWhenRunningCode(title: "test random item select", capacity: initCapacity ) {
        _ = array.select(index: rand)
    }
}

func testLastItemSelect<T: DynamicArray >(_ array: inout T) where T.Item == Int {

    let initCapacity = array.size()
    
    printTimeElapsedWhenRunningCode(title: "test last item select", capacity: initCapacity ) {
        _ = array.select(index: array.size()-1)
    }
}

func testInsertToTheEnd<T: DynamicArray >(_ array: inout T, capacity: Int) where T.Item == Int {
    printTimeElapsedWhenRunningCode(title: "test insert to the end", capacity: capacity){
        for n in 0...capacity-1 {
            array.insert(item: n)
        }
    }
}

func testRandomInsert<T: DynamicArray >(_ array: inout T, capacity: Int) where T.Item == Int {
    printTimeElapsedWhenRunningCode(title: "test random insert", capacity: capacity){
        for n in 0...capacity-1 {
            /// вставляем число n на раандомную позицию от 0 до n
            array.insert(item: n, index: Int.random(in: 0...n))
        }
    }
}

func testFirstInsert<T: DynamicArray >(_ array: inout T, capacity: Int) where T.Item == Int {
    printTimeElapsedWhenRunningCode(title: "test first insert", capacity: capacity){
        for n in 0...capacity-1 {
            array.insert(item: n, index: 0)
        }
    }
}

func testFirstRemove<T: DynamicArray >(_ array: inout T) where T.Item == Int {

    let initCapacity = array.size()
    
    printTimeElapsedWhenRunningCode(title: "test first remove", capacity: initCapacity ) {
        for _ in 0...initCapacity-1 {
            array.remove(index: 0 )
        }
    }
}

func testLastItemRemove<T: DynamicArray >(_ array: inout T) where T.Item == Int {
    
    let initCapacity = array.size()
    
    printTimeElapsedWhenRunningCode(title: "test last item remove", capacity: initCapacity ) {
        for _ in 0...initCapacity-1 {
            array.remove()
        }
    }
}

func testRandomRemove<T: DynamicArray >(_ array: inout T) where T.Item == Int {

    let initCapacity = array.size()
    
    printTimeElapsedWhenRunningCode(title: "test random remove", capacity: initCapacity ) {
        for _ in 0...initCapacity-1 {
            array.remove(index: Int.random(in: 0...array.size()-1 ))
        }
    }
}

func printTimeElapsedWhenRunningCode(title:String, capacity: Int, operation:()->()) {
    print(title)
    let start = CFAbsoluteTimeGetCurrent()
    operation()
    let end = CFAbsoluteTimeGetCurrent()
    let avgExecutionTime : CFAbsoluteTime = end - start
    let timePerItem = avgExecutionTime * 1000 / (Double) (capacity)
    let avgTimeStr = "\(avgExecutionTime)".replacingOccurrences(of: "e|E", with: " × 10^", options: .regularExpression, range: nil)
    print("Total execution time: \(avgTimeStr)s ; per item: \(timePerItem) mks")
}
