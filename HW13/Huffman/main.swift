//
//  main.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 06.02.2021.
//

import Foundation

let huffman: Huffman = .init()
huffman.CompressFile(dataFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/abra.txt", archFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/abra.txt.huf")
huffman.DecompressFile(archFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/abra.txt.huf", dataFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/abra.txt.huf.txt")
