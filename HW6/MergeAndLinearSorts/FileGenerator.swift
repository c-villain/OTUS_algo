//
//  FileGenerator.swift
//  LinearSorts
//
//  Created by Alexander Kraev on 05.03.2021.
//

import Foundation

extension FileManager {

    func directoryExists(atUrl url: URL) -> Bool {
        var isDirectory: ObjCBool = false
        let exists = self.fileExists(atPath: url.path, isDirectory:&isDirectory)
        return exists && isDirectory.boolValue
    }
}

final class FileGenerator {
    
    private var path: String
    
    init(path: String) {
        self.path = path
    }
    
    public func generateFile(fileName: String = "test", total: UInt64) -> Void {
        let fileMgr = FileManager.default
        let inFile: String = "\(path)/\(fileName).in"
        
        if !fileMgr.directoryExists(atUrl: URL(fileURLWithPath: path)) {
            do {
                try fileMgr.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            } catch let error as NSError {
                NSLog("Unable to create directory \(error.debugDescription)")
            }
        }
        
        if fileMgr.createFile(atPath: inFile, contents: nil, attributes: nil) {
            let filePath = URL(fileURLWithPath: inFile)
            
            let start = CFAbsoluteTimeGetCurrent()
            
            var ints: [Int] = .init()
            for _ in 0..<total {
                ints.append(Int.random(in: 0..<65535))
            }
            
            ///https://developer.apple.com/forums/thread/97222
            do {
                let data = try JSONEncoder().encode(ints)
                try data.write(to: filePath)
            }

            catch let error as NSError {
                NSLog("Unable to write array \(error.debugDescription)")
            }

            let end = CFAbsoluteTimeGetCurrent()
            let avgExecutionTime : CFAbsoluteTime = end - start
            let avgTimeStr = "\(avgExecutionTime)".replacingOccurrences(of: "e|E", with: " × 10^", options: .regularExpression, range: nil)
            print("Total execution time: \(avgTimeStr)s")
        }
    }
    
}
