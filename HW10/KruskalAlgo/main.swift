//
//  main.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 06.02.2021.
//

import Foundation

var graphWithCycle = AdjacencyMatrix(vertexCount: 6)

// описание для вершины 0: соединена с вершиной 1 ребром весом 2, с вершиной 2 ребром весом 6,
// с вершиной 3 ребром весом 7, с вершиой 4 ребром весом 15
graphWithCycle.add(vertex: 0, adjacents: [0,2,6,7,15,0])
// и т.д.
graphWithCycle.add(vertex: 1, adjacents: [2,0,0,3,0,0])
graphWithCycle.add(vertex: 2, adjacents: [6,0,0,1,4,3])
graphWithCycle.add(vertex: 3, adjacents: [7,3,1,0,0,16])
graphWithCycle.add(vertex: 4, adjacents: [15,0,4,0,0,10])
graphWithCycle.add(vertex: 5, adjacents: [0,0,3,16,10,0])
print(graphWithCycle)
print(graphWithCycle.kruskal())

