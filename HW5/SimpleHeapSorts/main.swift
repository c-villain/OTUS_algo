//
//  main.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 06.02.2021.
//

import Foundation

///HW5

/// BubbleSort
let bubbleSortingOnRandom = Tester(path: "/Users/c-villain/Downloads/sorting-tests/0.random", sorted: bubbleSort)
bubbleSortingOnRandom.RunTest()

let bubbleSortingOnDigits = Tester(path: "/Users/c-villain/Downloads/sorting-tests/1.digits", sorted: bubbleSort)
bubbleSortingOnDigits.RunTest()

let bubbleSortingOnSorted = Tester(path: "/Users/c-villain/Downloads/sorting-tests/2.sorted", sorted: bubbleSort)
bubbleSortingOnSorted.RunTest()

let bubbleSortingOnRevers = Tester(path: "/Users/c-villain/Downloads/sorting-tests/3.revers", sorted: bubbleSort)
bubbleSortingOnRevers.RunTest()

/// InsertionSort
let insertSortingOnRandom = Tester(path: "/Users/c-villain/Downloads/sorting-tests/0.random", sorted: insertSort)
insertSortingOnRandom.RunTest()

let insertSortingOnDigits = Tester(path: "/Users/c-villain/Downloads/sorting-tests/1.digits", sorted: insertSort)
insertSortingOnDigits.RunTest()

let insertSortingOnSorted = Tester(path: "/Users/c-villain/Downloads/sorting-tests/2.sorted", sorted: insertSort)
insertSortingOnSorted.RunTest()

let insertSortingOnRevers = Tester(path: "/Users/c-villain/Downloads/sorting-tests/3.revers", sorted: insertSort)
insertSortingOnRevers.RunTest()

/// ShellSort
/// gap = shell
let shellSortingOnRandom = Tester(path: "/Users/c-villain/Downloads/sorting-tests/0.random", sorted: shellSort)
shellSortingOnRandom.RunTest()

let shellSortingOnDigits = Tester(path: "/Users/c-villain/Downloads/sorting-tests/1.digits", sorted: shellSort)
shellSortingOnDigits.RunTest()

let shellSortingOnSorted = Tester(path: "/Users/c-villain/Downloads/sorting-tests/2.sorted", sorted: shellSort)
shellSortingOnSorted.RunTest()

let shellSortingOnRevers = Tester(path: "/Users/c-villain/Downloads/sorting-tests/3.revers", sorted: shellSort)
shellSortingOnRevers.RunTest()

/// gap = hibbard
let hibbardSortingOnRandom = Tester(path: "/Users/c-villain/Downloads/sorting-tests/0.random", sorted: hibbardSort)
hibbardSortingOnRandom.RunTest()

let hibbardSortingOnDigits = Tester(path: "/Users/c-villain/Downloads/sorting-tests/1.digits", sorted: hibbardSort)
hibbardSortingOnDigits.RunTest()

let hibbardSortingOnSorted = Tester(path: "/Users/c-villain/Downloads/sorting-tests/2.sorted", sorted: hibbardSort)
hibbardSortingOnSorted.RunTest()

let hibbardSortingOnRevers = Tester(path: "/Users/c-villain/Downloads/sorting-tests/3.revers", sorted: hibbardSort)
hibbardSortingOnRevers.RunTest()

/// gap = knuth
let knuthSortingOnRandom = Tester(path: "/Users/c-villain/Downloads/sorting-tests/0.random", sorted: knuthSort)
knuthSortingOnRandom.RunTest()

let knuthSortingOnDigits = Tester(path: "/Users/c-villain/Downloads/sorting-tests/1.digits", sorted: knuthSort)
knuthSortingOnDigits.RunTest()

let knuthSortingOnSorted = Tester(path: "/Users/c-villain/Downloads/sorting-tests/2.sorted", sorted: knuthSort)
knuthSortingOnSorted.RunTest()

let knuthSortingOnRevers = Tester(path: "/Users/c-villain/Downloads/sorting-tests/3.revers", sorted: knuthSort)
knuthSortingOnRevers.RunTest()

/// HeapSort
let heapSortingOnRandom = Tester(path: "/Users/c-villain/Downloads/sorting-tests/0.random", sorted: heapSort)
heapSortingOnRandom.RunTest()

let heapSortingOnDigits = Tester(path: "/Users/c-villain/Downloads/sorting-tests/1.digits", sorted: heapSort)
heapSortingOnDigits.RunTest()

let heapSortingOnSorted = Tester(path: "/Users/c-villain/Downloads/sorting-tests/2.sorted", sorted: heapSort)
heapSortingOnSorted.RunTest()

let heapSortingOnRevers = Tester(path: "/Users/c-villain/Downloads/sorting-tests/3.revers", sorted: heapSort)
heapSortingOnRevers.RunTest()
