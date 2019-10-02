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
        
        var res = [Int]()
        
        for i in 0..<nums.count - 1 {
            var max = i
            for j in (i + 1)..<nums.count {
                if nums[max] < nums[j] {
                    max = j
                }
            }
            
            nums.swapAt(j, max)
        }
        
        return res
    }
}
