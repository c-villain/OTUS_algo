//
//  AdjacencyMatrix.swift
//  SpanningTree
//
//  Created by Alexander Kraev on 12.04.2021.
//

import Foundation

// матрица смежностей графа с весами ребер
final class AdjacencyMatrix: CustomStringConvertible {
    private var cols: Int
    private var rows: Int
    private var matrix: [Int]

    
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
         Список родителей.
         Формат следующий: [0,1,2,3,4,5] - все 5 вершин изолированы
                         [1,1,2,3,4,5] - вершины 0 и 1 соединены ребром (так как на 0 месте массива стоит 1)
                         [2,1,2,3,4,5] - вершины 0 и 2 соединены ребром (так как на 0 месте массива стоит 2)
    */
    private var parent: [Int] = .init()
    
    /**
        Функция нахождения родителя у вершины
     */
    func findParent (vertex: Int) -> Int {
        if (parent[vertex] == vertex) {
            return vertex
        } else {
            return findParent(vertex: parent[vertex])
        }
    }

    /**
        Функция связывания вершин
        если мы сделать переметку у i-ой вершины, значит связали ребром
     */
    func createSharedParent(v1: Int, v2: Int) {
        let a = findParent(vertex: v1)
        let b = findParent(vertex: v2)
        parent[a] = b
    }
    
    /**
        Функция получения минимального остовного дерева методом Краскала
     */
    
    func kruskal() -> [Edge] {
        var edges: [Edge] = .init()
        // добавляем все вершины как изолированные
        // в cols (как и в rows) записано число вершин
        for i in 0..<cols {
            parent.append(i)
        }
        // изначально число ребер 0
        // далее мы будем считать новые ребра
        // как только будет n-1 мы построили мин дерево
        var edgeCount = 0
        
        while edgeCount < cols - 1 {
            // вначале ставим самое большое число, чтоб потом постоянно уменьшать минимум
            var min = Int.max
            var a = -1
            var b = -1
            for col in 0...cols - 1 {
                for row in 0...rows - 1 {
                    if ( findParent(vertex: row) != findParent(vertex: col) && 0 < self[col][row] && self[col][row] < min ) {
                        min = self[col][row]
                        a = row
                        b = col
                    }
                }
            }
            createSharedParent(v1: a, v2: b)
            
            edges.append(Edge(num: edgeCount, v1: a, v2: b, cost: min))
            edgeCount += 1
        }
        return edges
    }

}
    /**
    Edge - класс, содержащий пару вершин,
    которые соединяет это ребро Edge
     */
final class Edge : CustomStringConvertible {
    
    var num: Int
    var v1: Int
    var v2: Int
    var cost: Int
    
    init(num: Int, v1: Int, v2: Int, cost: Int) {
        self.num = num
        self.v1 = v1
        self.v2 = v2
        self.cost = cost
    }
    
    var description: String {
        String("Edge \(num): v1:\(v1) v2:\(v2), cost: \(cost)")
    }
}
