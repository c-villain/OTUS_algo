//
//  main.swift
//  Otus_algo
//
//  Created by Alexander Kraev on 06.02.2021.
//

import Foundation

let Ns: [Int] = [10, 1000, 2000, 5000, 10000]
let Fs: [Int] = [10, 20, 30]
for N in Ns {
    for F in Fs {
        print("N: \(N), F: \(F)")
        let sarah: Sarah = .init(N: N, M: N, factor: F)
//        print(sarah)
        sarah.start()
        print("_______________________________________")
    }
}

