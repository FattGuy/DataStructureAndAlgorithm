//
//  InsertionSort.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 10/30/17.
//  Copyright © 2017 Feng Chang. All rights reserved.
//

import Foundation

class InsertionSort {
    
    func insertionSort(_ array:[Int]) -> [Int] {
        var a = array
        for x in 1..<a.count {
            var y = x
            while y > 0 && a[y] < a[y - 1] {
                a.swapAt(y - 1, y)
                y -= 1
            }
        }
        return a
    }
}
