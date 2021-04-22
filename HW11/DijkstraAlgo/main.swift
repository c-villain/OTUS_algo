//
//  main.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 06.02.2021.
//

import Foundation

var graphWithCycle = AdjacencyMatrix(vertexCount: 7)

// Описание графа как из лекции:
// описание для вершины 0: соединена с вершиной 1 ребром весом 2, с вершиной 2 ребром весом 3,
// с вершиной 3 ребром весом 6
// если ребра нет, то указываем как Int.max, то есть бесконечность
graphWithCycle.add(vertex: 0, adjacents: [Int.max,2,3,6,Int.max,Int.max,Int.max]) //A
// и т.д.
graphWithCycle.add(vertex: 1, adjacents: [2,Int.max,4,Int.max,9,Int.max,Int.max]) //B
graphWithCycle.add(vertex: 2, adjacents: [3,4,Int.max,1,7,8,Int.max]) //C
graphWithCycle.add(vertex: 3, adjacents: [6,Int.max,1,Int.max,Int.max,4,Int.max]) //D
graphWithCycle.add(vertex: 4, adjacents: [Int.max,9,7,Int.max,Int.max,1,5]) //E
graphWithCycle.add(vertex: 5, adjacents: [Int.max,Int.max,6,4,1,Int.max,8]) //F
graphWithCycle.add(vertex: 6, adjacents: [Int.max,Int.max,Int.max,Int.max,5,8,Int.max]) //G
//A0, B1, C2, D3, E4, F5, G6
print(graphWithCycle)
print(graphWithCycle.dijkstra(source: 0, destination: 6))
print(graphWithCycle.dijkstra(source: 0, destination: 1))
print(graphWithCycle.dijkstra(source: 1, destination: 4))
//print(graphWithCycle.)

