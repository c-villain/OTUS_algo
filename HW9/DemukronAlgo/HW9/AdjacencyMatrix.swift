//
//  AdjacencyMatrix.swift
//  TopologicalSort
//
//  Created by Alexander Kraev on 12.04.2021.
//

import Foundation

// матрица смежностей
class AdjacencyMatrix: CustomStringConvertible {
    var cols: Int
    var rows: Int
    var matrix: [Int]

    /**
     Матрица смежнотей всегда квадратная
     но не симметричная, так как граф направленный - оргграф
     
     - Parameters vertexCount: количество вершин
     */
    init(vertexCount: Int) {
        self.cols = vertexCount
        self.rows = vertexCount
        matrix = Array(repeating:0, count:cols*rows)
    }
    
    subscript(col: Int, row: Int) -> Int {
        get { return matrix[cols * row + col] }
        set { matrix[cols*row+col] = newValue }
    }
    
    subscript(row: Int) -> [Int] {
        get {
            var matrixRow: [Int] = .init()
            for col in 0...cols-1 {
                matrixRow.append(matrix[cols * row + col])
            }
            return matrixRow
        }
    }
    
    /**
     Функция добавления вектора смежности в матрицу смежностей
     
     - Parameters vertex: вершина
     - Parameters adjacents: номера смежных вершин
     */
    func add(vertex: Int, adjacents: [Int]) {
        _ = adjacents.map {
            self[$0, vertex] = 1
        }
    }
    
    /**
     для вывода на экран
     выводить будем построчно
     */
    var description: String {
        var string = ""
        for row in 0...rows - 1 {
            for col in 0...cols - 1 {
                string += String(self[col, row]) + " "
            }
            string += "\n"
        }
        return string
    }
    
    /**
        Функция получения топологической сортировки на основе алгоритма Демукрона
        
       - Returns: массив вершин в порядке топологии,
            например [0, [4,8], [1,5,6], [2,3], 7], где 0 - исток, 7 - сток
     */
    
    func getTopology() throws -> [[Int]] {
        
        enum TopologyError: Error {
            case cycle
        }
        
        // вычитаем один массив из другого одной длинны
        func subtract(_ array: [Int], _ from: [Int]) -> [Int]{
            assert(array.count == from.count)
            var output: [Int] = .init()
            for index in (0 ..< from.count) {
                output.append(from[index] - array[index])
            }
            return output
        }
        
        // считаем полустепени захода для вершин
        func getEntriesCount() -> [Int] {
            var entries: [Int] = .init()
            for col in 0...cols - 1  {
                var visits = 0
                for row in 0...rows - 1 {
                    visits += self[col, row]
                }
                entries.append(visits)
            }
            return entries
        }
        
        func isFinished(entries: [Int]) -> Bool {
            !entries.contains { $0 > 0 }
        }
        
        func getZeroColumns() -> [Int] {
            entries.enumerated()
                .filter { (index, item) in item == 0 } // сначала  берем те столбцы, которые обнулились
                .map{ $0.offset }
                .filter { item in !layers.flatMap{ $0 }.contains(item) } // потом смотрим не обнулились ли они раньше, чтоб не делать лишнее действие
        }
        
        var layers: [[Int]] = .init()
        var entries: [Int] = getEntriesCount()
        
        repeat {
            let layer = getZeroColumns()
            if layer.count > 0 {
                // добавляем очередную топологию
                layers.append(layer)
                for rowNum in layer {
                    // вычитаем из вектора полустепеней захода строки из топологии
                    entries = subtract(self[rowNum], entries)
                }
            }
            else {
                throw TopologyError.cycle
//                break
            }
        } while (!isFinished(entries: entries))
        
        // добавим последний слой для стока:
        let layer = getZeroColumns()
        if layer.count > 0 {
            layers.append(layer)
        }
        
        return layers
    }
}

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}
