//
//  Tester.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 26.02.2021.
//

import Foundation

final class Tester {
    
    private var path: String
    private var sorted: (inout [Int]) -> ()
    
    init(path: String, sorted: @escaping (inout [Int]) -> () ) {
        self.path = path
        self.sorted = sorted
    }
    
    public func RunTest() -> Void {
        var testNum: Int = 0
        let fileMgr = FileManager.default
        while(true) {
            let inFile: String = "\(path)/test.\(testNum).in"
            let outFile: String = "\(path)/test.\(testNum).out"
            if (!fileMgr.fileExists(atPath: inFile) ) { break }
            print("Test \(testNum):")
            RunTest(input: inFile, output: outFile)
            print("--------------------------------")
            testNum += 1
        }
        print("Test files ended")
    }
    
    private func RunTest(input: String, output: String) {
        
        func createFile(path: String, output: String, with data: [Int]){
            let urlPath = URL(fileURLWithPath: path)
            
            let fileMgr = FileManager.default
            
            if !fileMgr.directoryExists(atUrl: urlPath) {
                do {
                    try fileMgr.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                } catch let error as NSError {
                    NSLog("Unable to create directory \(error.debugDescription)")
                }
            }
            
            if fileMgr.createFile(atPath: output, contents: nil, attributes: nil) {
                let filePath = URL(fileURLWithPath: output)

                ///https://developer.apple.com/forums/thread/97222
                do {
                    let data = try JSONEncoder().encode(data)
                    try data.write(to: filePath)
                    print("Out file created!")
                }
                catch let error as NSError {
                    NSLog("Unable to write array \(error.debugDescription)")
                }
            }
        }
        
        func read(from url: URL) throws -> [Int] {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([Int].self, from: data)
        }
        
        do {
            var array = try read(from: URL(fileURLWithPath: input))
            print("Count: \(array.count)")
            let start = CFAbsoluteTimeGetCurrent()
            self.sorted(&array)
            let end = CFAbsoluteTimeGetCurrent()
            let avgExecutionTime : CFAbsoluteTime = end - start
            let avgTimeStr = "\(avgExecutionTime)".replacingOccurrences(of: "e|E", with: " × 10^", options: .regularExpression, range: nil)
            print("Total sorting time: \(avgTimeStr)s")
            createFile(path: path, output: output, with: array)
            let totalEnd = CFAbsoluteTimeGetCurrent()
            let totalExecutionTime : CFAbsoluteTime = totalEnd - start
            let totalTimeStr = "\(totalExecutionTime)".replacingOccurrences(of: "e|E", with: " × 10^", options: .regularExpression, range: nil)
            print("Total time (with creating out file): \(totalTimeStr)s")
        }
        catch let error as NSError {
            print("Error: \(error)")
        }
    }
}
