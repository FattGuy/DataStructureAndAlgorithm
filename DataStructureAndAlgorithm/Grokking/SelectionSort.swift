//
//  SelectionSort.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 10/1/19.
//  Copyright © 2019 Feng Chang. All rights reserved.
//

import Foundation

class SelectionSortNEW {
    func selectionSorting(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else { return [] }
        
        var res = nums
        
        for i in 0..<res.count - 1 {
            var max = i
            for j in (i + 1)..<res.count {
                if res[max] < res[j] {
                    max = j
                }
            }
            
            res.swapAt(i, max)
        }
        
        return res
    }
}
