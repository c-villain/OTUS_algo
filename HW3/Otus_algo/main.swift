//
//  main.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 06.02.2021.
//

import Foundation

//HW3

// для короля:
let king = ChessStepCounter(.king)
let tester_king = Tester(path: "/Users/c-villain/Downloads/0.BITS/1.Bitboard - Король", task: king)
tester_king.RunTest()

// для коня:
let knight = ChessStepCounter(.knight)
let tester_knight = Tester(path: "/Users/c-villain/Downloads/0.BITS/2.Bitboard - Конь", task: knight)
tester_knight.RunTest()

// для ладьи:
let rook = ChessStepCounter(.rook)
let tester_rook = Tester(path: "/Users/c-villain/Downloads/0.BITS/3.Bitboard - Ладья", task: rook)
tester_rook.RunTest()

// для слона:
let bishop = ChessStepCounter(.bishop)
let tester_bishop = Tester(path: "/Users/c-villain/Downloads/0.BITS/4.Bitboard - Слон", task: bishop)
tester_bishop.RunTest()

// для ферзя:
let queen = ChessStepCounter(.queen)
let tester_queen = Tester(path: "/Users/c-villain/Downloads/0.BITS/5.Bitboard - Ферзь", task: queen)
tester_queen.RunTest()
