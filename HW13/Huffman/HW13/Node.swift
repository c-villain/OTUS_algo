//
//  Node.swift
//  Huffman
//
//  Created by Alexander Kraev on 22.05.2021.
//

import Foundation

// MARK: - Huffman's tree node
final class Node {
    
    // Huffman's tree leaf
    public var symbol: byte? // symbol
    public var freq: Int // symbol's frequency
    
    // if node is not leaf:
    public var bit0: Node?
    public var bit1: Node?
    
    init(symbol: byte, freq: Int) {
        self.symbol = symbol
        self.freq = freq
    }
    
    init(bit0: Node, bit1: Node, freq: Int) {
        self.bit0 = bit0
        self.bit1 = bit1
        self.freq = freq
    }
}
