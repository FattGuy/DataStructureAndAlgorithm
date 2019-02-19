//
//  SelectMinimumMaximum.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 2/18/19.
//  Copyright © 2019 Feng Chang. All rights reserved.
//

import Foundation

class SelectMinimumMaximum {
    func minimum<T: Comparable>(_ array: [T]) -> T? {
        guard var min = array.first else {
            return nil
        }
        
        for element in array.dropFirst() {
            min = element < min ? element : min
        }
        
        return min
    }
    
    func maximum<T: Comparable>(_ array: [T]) -> T? {
        guard var max = array.first else {
            return nil
        }
        
        for element in array.dropFirst() {
            max = element > max ? element : max
        }
        
        return max
    }
    
    func minimumMaximum<T: Comparable>(_ array: [T]) -> (minimum: T, maximum: T)? {
        guard var min = array.first else {
            return nil
        }
        
        var max = min
        let start = array.count % 2
        
        for i in stride(from: start, to: array.count, by: 2) {
            let pair = (array[i], array[i + 1])
            
            if pair.0 > pair.1 {
                if pair.0 > max {
                    max = pair.0
                }
                if pair.1 < min {
                    min = pair.1
                }
            } else {
                if pair.0 < min {
                    min = pair.0
                }
                if pair.1 > max {
                    max = pair.1
                }
            }
        }
        
        return (min, max)
    }
}
