//
//  main.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 06.02.2021.
//

import Foundation



///HW6

print("Generating files...")
let file0: FileGenerator = .init(path: "/Users/c-villain/Downloads/linear-sorts")
file0.generateFile(fileName: "test.0", total: 1000)

let file1: FileGenerator = .init(path: "/Users/c-villain/Downloads/linear-sorts")
file1.generateFile(fileName: "test.1", total: 100_000)

let file2: FileGenerator = .init(path: "/Users/c-villain/Downloads/linear-sorts")
file2.generateFile(fileName: "test.2", total: 1_000_000)

let file3: FileGenerator = .init(path: "/Users/c-villain/Downloads/linear-sorts")
file3.generateFile(fileName: "test.3", total: 10_000_000)

let file4: FileGenerator = .init(path: "/Users/c-villain/Downloads/linear-sorts")
file4.generateFile(fileName: "test.4", total: 100_000_000)
print("______________")

print("merge sorting")
let mergeSorting = Tester(path: "/Users/c-villain/Downloads/linear-sorts", sorted: mergeSort)
mergeSorting.RunTest()
print("______________")

print("merge sorting with shell")
let mergeSortWithShellSorting = Tester(path: "/Users/c-villain/Downloads/linear-sorts", sorted: upgradedMergeSortWithShell)
mergeSortWithShellSorting.RunTest()
print("______________")

print("merge sorting with heap sorting")
let mergeSortWithHeapSorting = Tester(path: "/Users/c-villain/Downloads/linear-sorts", sorted: upgradedMergeSortWithHeap)
mergeSortWithHeapSorting.RunTest()
print("______________")

print("bucket sorting standart implementation")
let bucketSorting = Tester(path: "/Users/c-villain/Downloads/linear-sorts", sorted: uint16_bucketSort )
bucketSorting.RunTest()
print("______________")

print("bucket with heap sorting")
let bucketWithHeapSorting = Tester(path: "/Users/c-villain/Downloads/linear-sorts", sorted: uint16_bucketWithHeapSort )
bucketWithHeapSorting.RunTest()
print("______________")

print("upgraded bucket sorting")
let upgratedBucketSorting = Tester(path: "/Users/c-villain/Downloads/linear-sorts", sorted: uint16_upgradedBucketSort )
upgratedBucketSorting.RunTest()
print("______________")
