//
//  SelectionSort.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 2/26/19.
//  Copyright © 2019 Feng Chang. All rights reserved.
//

import Foundation

class SelectionSort {
    func selectionSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else {
            return array
        }
        
        var a = array
        
        for x in 0..<a.count - 1 {
            var lowest = x
            for y in (x + 1)..<a.count {
                if a[y] < a[lowest] {
                    lowest = y
                }
            }
            
            if x != lowest {
                a.swapAt(x, lowest)
            }
        }
        
        return a
    }
}
