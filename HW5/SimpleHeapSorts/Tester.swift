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
            if (!fileMgr.fileExists(atPath: inFile) || !fileMgr.fileExists(atPath: outFile)) { break }
            let res = RunTest(input: inFile, output: outFile)
            print("Test \(testNum): - \(res.result): \(res.message)")
            print("--------------------------------")
            testNum += 1
        }
        print("Test files ended")
    }
    
    private func RunTest(input: String, output: String) -> (result: Bool, message: String) {
        do {
            let inputText = try String(contentsOfFile: input, encoding: String.Encoding.utf8)
            let data: [String] = inputText.split(separator: "\r\n", omittingEmptySubsequences: true).map(String.init)
            
            print("Capacity: \(data[0])")
            var inputData = data[1].components(separatedBy: " ").compactMap { Int($0) }
            
            let outputText: String = try String(contentsOfFile: output, encoding: String.Encoding.utf8)
            let outputData = outputText.split(separator: "\r\n", omittingEmptySubsequences: true).map(String.init)
            let expect = outputData[0].components(separatedBy: " ").compactMap { Int($0) }
            
            let start = CFAbsoluteTimeGetCurrent()
//            let actual = self.sorted(inputData)
            self.sorted(&inputData)
            let end = CFAbsoluteTimeGetCurrent()
            let avgExecutionTime : CFAbsoluteTime = end - start
            let avgTimeStr = "\(avgExecutionTime)".replacingOccurrences(of: "e|E", with: " × 10^", options: .regularExpression, range: nil)
            print("Total execution time: \(avgTimeStr)s")

            if inputData == expect { return (true, "OK")}
            else { return (false, "BAD")}
        }
        catch let error as NSError {
            print("Error: \(error)")
        }
        return (false, "Something something happened")
    }
}
