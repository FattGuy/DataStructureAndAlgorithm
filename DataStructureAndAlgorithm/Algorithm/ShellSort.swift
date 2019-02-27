//
//  ShellSort.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 2/26/19.
//  Copyright © 2019 Feng Chang. All rights reserved.
//

import Foundation

class ShellSort {
    func shellsort<T>(seq: inout [T]) where T : Comparable {
        var inc = seq.count / 2
        while inc > 0 {
            for (var i, el) in seq.enumerated() {
                while i >= inc && seq[i - inc] > el {
                    seq[i] = seq[i - inc]
                    i -= inc
                }
                seq[i] = el
            }
            if inc == 2 {
                inc = 1
            } else {
                inc = inc * 5 / 11
            }
        }
    }
}
