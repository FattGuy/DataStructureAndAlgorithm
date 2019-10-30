//
//  SumFunc.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 10/27/19.
//  Copyright © 2019 Feng Chang. All rights reserved.
//

//For excercise 4.1
import Foundation

class SumFunc {
    func sum(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        
        return nums.first! + sum(Array(nums.dropFirst()))
    }
}
