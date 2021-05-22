//
//  main.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 06.02.2021.
//

import Foundation

let huffman: Huffman = .init()
//TEXT:
huffman.CompressFile(dataFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/abra.txt", archFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/abra.txt.huf")
huffman.DecompressFile(archFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/abra.txt.huf", dataFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/abra.txt.huf.txt")

// Big text:
huffman.CompressFile(dataFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/Huffman.swift", archFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/Huffman.swift.huf")
huffman.DecompressFile(archFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/Huffman.swift.huf", dataFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/Huffman.swift.huf.swift")

//IMAGE:
huffman.CompressFile(dataFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/me.png", archFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/me.png.huf")
huffman.DecompressFile(archFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/me.png.huf", dataFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/me.png.huf.png")
