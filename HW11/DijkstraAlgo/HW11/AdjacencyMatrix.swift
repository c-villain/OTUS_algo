//
//  AdjacencyMatrix.swift
//  SpanningTree
//
//  Created by Alexander Kraev on 12.04.2021.
//

import Foundation

struct PathTable {
    let vertex: Int
    var weight: Int = Int.max // по-умолч бесконечность
    var previousVertex: Int?  // предыдущей точки нет
    var isDone: Bool = false  // значение обработано или нет
}

// матрица смежностей графа с весами ребер
final class AdjacencyMatrix: CustomStringConvertible {
    private var cols: Int
    private var rows: Int
    private var matrix: [Int]

    
    /**
     Матрица смежностей всегда квадратная
     но не симметричная, так как граф направленный - орграф
     
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
     - Parameters adjacents: веса ребер вершин
        например: вершина 3 соединена с вершиной 1 и 4 ребрами 3 и 8
                        add(vertex: 2, adjacents: [0,3,0,8]
     */
    func add(vertex: Int, adjacents: [Int]) {
        //количество указанных ребер в параметре должно быть равно количеству вершин
        //если ребра нет, то должно быть указано 0
        assert(adjacents.count == cols)
        adjacents.enumerated().forEach { (top, edge) in
            self[top, vertex] = edge
        }
    }
    
    /**
     Для вывода на экран.
     Выводить будем построчно
     */
    var description: String {
        var string = ""
        for row in 0...rows - 1 {
            for col in 0...cols - 1 {
                string += String(self[col, row] == Int.max ? 0 : self[col, row]) + " "
            }
            string += "\n"
        }
        return string
    }
    /**
        Функция получения соседей вершины,
        то есть вершин, инцедентных с данной (соединенных ребром)
        В матрице смежностей, если ребра нет, то записано число Int.max, аналогичное бесконечности
        ну и на всякий случай, берем ребра весом > 0
     */
    func neighbors(for vertex: Int)-> [Int] {
        self[vertex].indices.filter { self[vertex][$0] < Int.max && 0 < self[vertex][$0]}
    }
    
    
    func getLightestVertex(table: [PathTable]) -> Int? {
        table.filter { !$0.isDone }.sorted { $0.weight < $1.weight }.first?.vertex
    }

    /**
        Функция получения пути между вершинами минимального веса методом Дейкстры
     */

    func dijkstra(source v1: Int, destination v2: Int) -> [Edge]? {
        
        var table: [PathTable] = .init()
        
        // заполняем таблицу вершинами
        for vertex in 0..<cols {
            table.append(.init(vertex: vertex))
        }
        // выбираем начальную вершину,
        // то есть в начальной вершине ставим вес = 0
        table[v1].weight = 0
        
        var current: Int? = getLightestVertex(table: table) // текущая вершина
        while (current != nil) {
            if let current = current {
                for e in neighbors(for: current) {
                    let newWeight = self[current][e] + table[current].weight
                    if newWeight < table[e].weight {
                        table[e].weight = newWeight
                        table[e].previousVertex = current
                    }
                }
                table[current].isDone = true
            }
            current = getLightestVertex(table: table)
        }
        
        // теперь строим путь
        // если у вершины вес не бесконечен, значит путь найден:
        if table[v2].weight < Int.max, 0 < table[v2].weight {
            var edges: [Edge] = .init()
            
            var previousVertex = table[v2].previousVertex
            var vertex = table[v2].vertex
            while (previousVertex != v1) {
                if let prev = previousVertex {
                    let edge: Edge = .init(v1: vertex, v2: prev, cost: self[vertex][prev])
                    edges.append(edge)
                    vertex = table[prev].vertex
                    previousVertex = table[prev].previousVertex
                }
            }
            // добавляем последнее ребро:
            if let prev = previousVertex {
                let edge: Edge = .init(v1: vertex, v2: prev, cost: self[vertex][prev])
                edges.append(edge)
            }
            return edges
        } else { return nil }
    }

}
    /**
    Edge - класс, содержащий пару вершин,
    которые соединяет это ребро Edge
     */
final class Edge : CustomStringConvertible {
    var v1: Int
    var v2: Int
    var cost: Int
    
    init(v1: Int, v2: Int, cost: Int) {
        self.v1 = v1
        self.v2 = v2
        self.cost = cost
    }
    
    var description: String {
        String("v1:\(v1) v2:\(v2), cost: \(cost)")
    }
}
