//
//  main.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 06.02.2021.
//

import Foundation

// пример из лекции:
var graph = AdjacencyMatrix(vertexCount: 14)
graph.add(vertex: 0, adjacents: [2,12])
graph.add(vertex: 1, adjacents: [12])
graph.add(vertex: 2, adjacents: [])
graph.add(vertex: 3, adjacents: [2])
graph.add(vertex: 4, adjacents: [2,8,9])
graph.add(vertex: 5, adjacents: [3,10,11,12])
graph.add(vertex: 6, adjacents: [10])
graph.add(vertex: 7, adjacents: [1,3,5,6])
graph.add(vertex: 8, adjacents: [0,13])
graph.add(vertex: 9, adjacents: [0,6,11])
graph.add(vertex: 10, adjacents: [2,2])
graph.add(vertex: 11, adjacents: [])
graph.add(vertex: 12, adjacents: [2])
graph.add(vertex: 13, adjacents: [5])
print(graph)

do {
    try print(graph.getTopology())
} catch {
    print("Обнаружен цикл!")
}


var graphWithCycle = AdjacencyMatrix(vertexCount: 6)
graphWithCycle.add(vertex: 0, adjacents: [0,1,4])
graphWithCycle.add(vertex: 1, adjacents: [3])
graphWithCycle.add(vertex: 2, adjacents: [1,3])
graphWithCycle.add(vertex: 3, adjacents: [5])
graphWithCycle.add(vertex: 4, adjacents: [])
graphWithCycle.add(vertex: 5, adjacents: [])
print(graphWithCycle)

do {
    try print(graphWithCycle.getTopology())
} catch {
    print("Обнаружен цикл!")
}

