//
//  ShellSort.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 2/26/19.
//  Copyright © 2019 Feng Chang. All rights reserved.
//

import Foundation

class ShellSort {
    public func shellSort(_ list: inout [Int]) {
        var sublistCount = list.count / 2
        
        while sublistCount > 0 {
            for index in 0..<list.count {
                
                guard index + sublistCount < list.count else { break }
                if list[index] > list[index + sublistCount] {
                    list.swapAt(index, index + sublistCount)          }
                
                guard sublistCount == 1 && index > 0 else { continue }
                if list[index - 1] > list[index] {
                    list.swapAt(index - 1, index)
                    
                }
            }
            
            sublistCount = sublistCount / 2
        }
    }
}
