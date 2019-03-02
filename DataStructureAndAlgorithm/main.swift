//
//  main.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 10/30/17.
//  Copyright © 2017 Feng Chang. All rights reserved.
//

import Foundation

var list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]

func partitionLomuto<T: Comparable>(a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[high]
    
    var i = low
    for j in low..<high {
        if a[j] <= pivot {
            (a[i], a[j]) = (a[j], a[i])
            i += 1
        }
    }
    
    (a[i], a[high]) = (a[high], a[i])
    return i
}

func quickSortLomuto<T: Comparable>(a: inout [T], low: Int, high: Int){
    if low < high {
        let p = partitionLomuto(a: &a, low: low, high: high)
        quickSortLomuto(a: &a, low: low, high: p - 1)
        quickSortLomuto(a: &a, low: p + 1, high: high)
    }
}

print(quickSortLomuto(a: &list, low: 0, high: list.count - 1))
