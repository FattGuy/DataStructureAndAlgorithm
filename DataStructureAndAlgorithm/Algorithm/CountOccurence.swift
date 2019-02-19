//
//  CountOccurence.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 2/17/19.
//  Copyright © 2019 Feng Chang. All rights reserved.
//

import Foundation

class CountOccurence {
    func countOccurrencesOfKey(_ array: [Int], object: Int) -> Int? {
        func leftBoundary() -> Int? {
            var low = 0
            var high = array.count
            while low < high {
                let midIndex = low + (high - low)/2
                if array[midIndex] < object {
                    low = midIndex + 1
                } else {
                    high = midIndex
                }
            }
            
            return low
        }
        
        func rightBoundary() -> Int? {
            var low = 0
            var high = array.count
            while low < high {
                let midIndex = low + (high - low)/2
                if array[midIndex] > object {
                    high = midIndex
                } else {
                    low = midIndex + 1
                }
            }
            
            return low
        }
        
        return (rightBoundary() ?? 0) - (leftBoundary() ?? 0)
    }
}
