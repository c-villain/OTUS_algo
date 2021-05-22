//
//  Huffman.swift
//  Huffman
//
//  Created by Alexander Kraev on 21.05.2021.
//

import Foundation

typealias byte = UInt8

final class Huffman {
    
    private func readAllBytes(_ dataFilename: String) -> [byte] {
        let filePath = dataFilename

        var bytes: [byte] = .init()

        if let data = NSData(contentsOfFile: filePath) {
            var buffer: [byte] = .init(repeating: 0, count: data.length)
            data.getBytes(&buffer, length: data.length)
            bytes = buffer
        }
        return bytes
    }
    
    private func writeAllBytes(_ archFilename: String, _ bytes: [byte]) {
        let fileMgr = FileManager.default
        if fileMgr.createFile(atPath: archFilename, contents: nil, attributes: nil) {
            let filePath = URL(fileURLWithPath: archFilename)

            ///https://developer.apple.com/forums/thread/97222
            do {
                let data = Data(bytes)
                try data.write(to: filePath)
                print("Out file created!")
            }
            catch let error as NSError {
                NSLog("Unable to write array \(error.debugDescription)")
            }
        }
    }
    
    // MARK: - main method for compression
    public func CompressFile(dataFilename: String, archFilename: String) {
        let data: [UInt8] = self.readAllBytes(dataFilename)
        let arch = CompressBytes(data)
        self.writeAllBytes(archFilename, arch)
    }
    
    // MARK: - data's compression
    private func CompressBytes(_ data: [byte]) -> [byte] {
        let freqs: [Int] = CalculateFreq(data)
        let head: [byte] = CreateHeader(data.count, freqs)
        let root: Node? = CreateHuffmanTree(freqs)
        if let root = root {
            let codes: [String] = CreateHuffmanCodes(root)
            let bits: [byte] = Compress(data, codes)
            let final: [byte] = head + bits
            return final
        }
        return data
    }
    
    // MARK: - create frequency dictionary/table
    private func CalculateFreq(_ data: [byte]) -> [Int] {

        func NormalizeFreqs() {
            let max = freqs.max()
            guard let max = max else { return }
            if (max < 256) { return }
            for j in 0..<256 {
                if freqs[j] > 0 {
                    freqs[j] = 1 + freqs[j] * 255 / (max + 1)
                }
             }
        }
        
        var freqs: [Int] = .init(repeating: 0, count: 256) // 256 = total values number in 1 byte
        for byte in data {
            freqs[Int(byte)] += 1
        }
        
        NormalizeFreqs()
        return freqs
    }
    
    // MARK: - create Huffman's tree
    private func CreateHuffmanTree(_ freqs: [Int]) -> Node? {
        let pq: PriorityQueue<Node> = .init()
        freqs.enumerated().forEach { (index, freq) in
            if freq > 0 {
                pq.enqueue(priority: freq, item: .init(symbol: byte(index), freq: freq))
            }
        }

        while pq.size() > 1 {
            let bit0: Node? = pq.dequeue()
            let bit1: Node? = pq.dequeue()

            if let bit0 = bit0, let bit1 = bit1 {
                let freq: Int = bit0.freq + bit1.freq
                let next: Node = .init(bit0: bit0, bit1: bit1, freq: freq)
                pq.enqueue(priority: freq, item: next)
            }
        }

        return pq.dequeue()
    }
    
    // MARK: - create codes for symbols
    private func CreateHuffmanCodes(_ root: Node) -> [String] {

        func Next(_ node: Node?, _ code: String) {
            if node?.bit0 == nil, let symbol = node?.symbol {
                codes[Int(symbol)] = code
            } else {
                Next(node?.bit0, code + "0")
                Next(node?.bit1, code + "1")
            }

        }

        var codes: [String] = .init(repeating: "", count: 256)
        Next(root, "")
        return codes
    }
    
    // MARK: - compress data with codes
    private func Compress(_ data: [byte], _ codes: [String]) -> [byte] {
        var bits: [byte] = .init()
        var sum: byte = 0
        var bit: byte = 1
        
        for symbol in data {
            for char in codes[Int(symbol)] {
                if char == "1" {
                    sum += bit
                }
                if (bit < 128) {
                    bit = bit << 1
                }
                else {
                    bits.append(sum)
                    sum = 0
                    bit = 1
                }
            }
        }
        if (bit > 1) {
            bits.append(sum)
        }
        return bits
    }
    
    // MARK: - create header for outfile
    private func CreateHeader(_ dataLength: Int, _ freqs: [Int])-> [byte] {
        var head: [byte] = .init()
        // для записи нужно 4 байта
        head.append(byte( dataLength          & 255))
        head.append(byte((dataLength  >> 8 )  & 255))
        head.append(byte((dataLength  >> 16 ) & 255))
        head.append(byte((dataLength  >> 24 ) & 255))
        for freq in freqs {
            head.append(byte(freq))
        }
        return head
    }
    
    // MARK: - main method for decompression
    public func DecompressFile( archFilename: String, dataFilename: String) {
        let data: [UInt8] = self.readAllBytes(archFilename)
        let arch = DecompressBytes(data)
        self.writeAllBytes(dataFilename, arch)
    }
    
    // MARK: - data's compression
    private func DecompressBytes(_ arch: [byte]) -> [byte] {
        var dataLength: Int = 0
        var startIndex: Int = 0
        var freqs: [Int] = .init(repeating: 0, count: 256)
        ParseHeader(arch, &dataLength, &startIndex, &freqs)
        let root: Node? = CreateHuffmanTree(freqs)
        if let root = root {
            let data: [byte] = Decompress(arch, startIndex, dataLength, root)
            return data
        }
        return arch
    }
    
    private func ParseHeader(_ arch: [byte], _ dataLength: inout Int,_ startIndex: inout Int,_ freqs: inout [Int]) {
        dataLength = Int(arch[0]       |
                         arch[1] << 8  |
                         arch[1] << 16 |
                         arch[1] << 24)
        for j in 0..<256 {
            freqs[j] = Int(arch[4 + j])
        }
        startIndex = 4 + 256
    }
    
    private func Decompress(_ arch: [byte], _ startIndex: Int, _ dataLength: Int, _ root: Node) -> [byte] {
        var size: Int = 0
        var curr: Node? = root
        var data: [byte] = .init()
        
        for j in startIndex..<arch.count {
            var bit: Int = 1
            var isFirstStep = true
            while bit < 128 {
                if !isFirstStep {
                    bit = bit << 1
                } else {
                    isFirstStep = false
                }
                
                let zero: Bool = (Int(arch[j]) & bit) == 0
                if (zero) {
                    curr = curr?.bit0
                } else {
                    curr = curr?.bit1
                }
                if curr?.bit0 != nil { continue }
                
                if size < dataLength, let symbol = curr?.symbol {
                    data.append(symbol)
                }
                size += 1
                curr = root
            }
        }
        
        return data
    }
}