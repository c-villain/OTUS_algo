//
//  main.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 06.02.2021.
//

import Foundation

let text = "OLOKOLOLOKKOLOL;wlkemrglkwemrgl;kmwe;lrkgm;wlekmrg;lkwmerlgkmw;lermg;lwKOLOKOLOLOKOLOKOLOLOKOLOKOLOLOKOLOKOLOLOKOLOKOLOLOKOLOKOLOLOKOLOKOLOLOKOLOKOLOLOKOLOKOLOLOKOLOKOLOLOKOLOKOLOLOKOLOKOLOLOKOLOKOLOLOKOLOKOLOLOKOLOKOLOLOKOLOKOLOLOkmKOLOKOLOLOLwenrgkwner;glknwe;lkrgnw;lekrng;lewnr;lgknwe;lrkng;lkwenr;glknwe;lkrgn;lwkenrg;lknwe;lrkgn;wlknergknwelrgn;lwnerg;lKOLOKOLOLOKOLOKOLOLOKOLOKOLOLOKOLOKOLOLOKOLOKOLOLOw"
let pattern = "KOLOKOL"

print("Char by char from the beginning: \(text.charByCharFromTheBeginning(for: pattern))")
print("Char by char from the end: \(text.charByCharFromTheEnd(for: pattern))")
print("Boyer–Moore–Horspool: \(text.boyerMooreHorspool(for: pattern))")
print("Boyer-Moore: \(text.boyerMoore(for: pattern))")
