//
//  main.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 06.02.2021.
//

import Foundation



///HW8

/**
 // testing hash table:
 let table : HashTable<String, Int> = .init()
 print(table.size)

 print(table.capacity())
 print(table)
 table.put(key: "dog", value: 15) //
 table.put(key: "cat", value: 20) //
 table.put(key: "elephant", value: 30) //
 table.put(key: "tiger", value: 50) //
 table.put(key: "mouse", value: 70) //+
 table.put(key: "white tiger", value: 1000) //+
 table.put(key: "small mouse", value: 12) //+
 table.put(key: "big cat", value: 250) //+
 table.put(key: "big dog", value: 200) //+
 table.put(key: "smokie", value: 300) //+
 table.put(key: "bluebird", value: 150) //+
 table.put(key: "bird", value: 100) //+
 print(table)
 print(table.size)
 table.del(key: "dog")
 print(table.size)
 print("dog: ", table.get(key: "dog"))
 print("cat: ", table.get(key: "cat"))
 print("elephant: ", table.get(key: "elephant"))
 print("tiger: ", table.get(key: "tiger"))
 print("mouse: ", table.get(key: "mouse"))
 print("white tiger: ", table.get(key: "white tiger"))
 print("small mouse: ", table.get(key: "small mouse"))
 print("big cat: ", table.get(key: "big cat"))
 print("big dog: ", table.get(key: "big dog"))
 print("smokie: ", table.get(key: "smokie"))
 print("bluebird: ", table.get(key: "bluebird"))
 print("bird: ", table.get(key: "bird"))
 print(table.size)
 */


let table : OpenAddressingHashTable<String, Int> = .init()
print(table.size)
print(table.capacity())
table.put(key: "dog", value: 15) //
table.put(key: "cat", value: 20) //
table.put(key: "elephant", value: 30) //
table.put(key: "tiger", value: 50) //
table.put(key: "mouse", value: 70) //
print(table)
table.put(key: "white tiger", value: 1000) //
table.put(key: "small mouse", value: 12) //
table.put(key: "big cat", value: 250) //
table.put(key: "dog", value: 200) //
table.put(key: "smokie", value: 300) //
table.put(key: "bluebird", value: 150) //
table.put(key: "bird", value: 100)
print(table)
print(table.size)
print(table.capacity())
//print("dog: ", table.get(key: "dog"))
//table.del(key: "dog")
//print("cat: ", table.get(key: "cat"))
//print("bluebird: ", table.get(key: "bluebird"))

/*
let numOfElements = 10_000_000
print ("\(numOfElements)")
print("Creating hash table:")
let hashTable = testForCreatingHT(numOfElements: numOfElements)
print("___________________")
print("test searching in hash table:")
testForSearchingElements(table: hashTable, numOfSearchingElements: numOfElements)
print("___________________")
print("test removing in hash table:")
testForRemovingElements(table: hashTable, numOfRemovingElements: numOfElements/10)

func testForCreatingHT(numOfElements: Int) -> HashTable<String, Int> {
    let start = CFAbsoluteTimeGetCurrent()
    let table : HashTable<String, Int> = .init()
    for _ in 0..<numOfElements {
        let rand = Int.random(in: 0...numOfElements-1)
        table.put(key: String(rand), value: rand)
    }
    let end = CFAbsoluteTimeGetCurrent()
    let totalExecutionTime : CFAbsoluteTime = end - start
    let totalTimeStr = "\(totalExecutionTime)".replacingOccurrences(of: "e|E", with: " × 10^", options: .regularExpression, range: nil)
    print("Total time for creating hash table: \(totalTimeStr)s")
    return table
}


func testForSearchingElements(table: HashTable<String, Int>, numOfSearchingElements: Int) {
    let start = CFAbsoluteTimeGetCurrent()
    for _ in 0..<numOfSearchingElements {
        let rand = Int.random(in: 0...numOfElements-1)
        table.get(key: String(rand))
    }
    let end = CFAbsoluteTimeGetCurrent()
    let totalExecutionTime : CFAbsoluteTime = end - start
    let totalTimeStr = "\(totalExecutionTime)".replacingOccurrences(of: "e|E", with: " × 10^", options: .regularExpression, range: nil)
    print("Total time for searching in hash table: \(totalTimeStr)s")
}

func testForRemovingElements(table: HashTable<String, Int>, numOfRemovingElements: Int) {
    let start = CFAbsoluteTimeGetCurrent()
    for _ in 0..<numOfRemovingElements {
        let rand = Int.random(in: 0...numOfElements-1)
        table.del(key: String(rand))
    }
    let end = CFAbsoluteTimeGetCurrent()
    let totalExecutionTime : CFAbsoluteTime = end - start
    let totalTimeStr = "\(totalExecutionTime)".replacingOccurrences(of: "e|E", with: " × 10^", options: .regularExpression, range: nil)
    print("Total time for removing in hash table: \(totalTimeStr)s")
}
*/
