//
//  Tester.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 06.02.2021.
//

import Foundation

final class Tester {
    
    private var path: String
    private var task: Task
    
    init(path: String, task: Task) {
        self.path = path
        self.task = task
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
            testNum += 1
        }
        print("Test files ended")
    }
    
    private func RunTest(input: String, output: String) -> (result: Bool, message: String) {
        do {
            let inputText = try String(contentsOfFile: input, encoding: String.Encoding.utf8)
            let data: [String] = inputText.split(separator: "\r\n", omittingEmptySubsequences: true).map(String.init)
            
            let outputText: String = try String(contentsOfFile: output, encoding: String.Encoding.utf8)
            let expect: [String] = outputText.split(separator: "\r\n", omittingEmptySubsequences: true).map(String.init)
            let expected: (String, String) = (expect[0], expect[1])
            let actual: (String, String) = task.run(data)

            if actual == expected { return (true, "OK, actual: \(actual)")}
            else { return (false, "expect: \(expect), actual: \(actual)")}
        }
        catch let error as NSError {
            print("Error: \(error)")
        }
        return (false, "Something something happened")
    }
    
}
