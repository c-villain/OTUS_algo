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

//// Big text:
huffman.CompressFile(dataFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/Huffman.swift", archFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/Huffman.swift.huf")
huffman.DecompressFile(archFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/Huffman.swift.huf", dataFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/Huffman.swift.huf.swift")

//IMAGE:
huffman.CompressFile(dataFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/me.png", archFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/me.png.huf")
huffman.DecompressFile(archFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/me.png.huf", dataFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/me.png.huf.png")

//MP3:
huffman.CompressFile(dataFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/elvis.mp3", archFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/elvis.mp3.huf")
huffman.DecompressFile(archFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/elvis.mp3.huf", dataFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/elvis.mp3.huf.mp3")

//WAV:
huffman.CompressFile(dataFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/example.wav", archFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/example.wav.huf")
huffman.DecompressFile(archFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/example.wav.huf", dataFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/example.wav.huf.wav")

//Archive:
huffman.CompressFile(dataFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/Huffman.swift.zip", archFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/Huffman.swift.zip.huf")
huffman.DecompressFile(archFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/Huffman.swift.zip.huf", dataFilename: "/Users/c-villain/Developer/OTUS_algo/HW13/Tests/Huffman.swift.zip.huf.zip")
