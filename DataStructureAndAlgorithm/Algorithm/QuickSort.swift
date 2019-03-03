//
//  QuickSort.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 3/2/19.
//  Copyright © 2019 Feng Chang. All rights reserved.
//

import Foundation

class QuickSort {
    func quickSort<T: Comparable>(a: [T]) -> [T] {
        if a.count <= 1 {
            return a
        } else {
            let pivot = a[a.count / 2]
            let less = a.filter({ $0 < pivot })
            let equal = a.filter({ $0 == pivot })
            let greater = a.filter({ $0 > pivot })
            
            return quickSort(a: less) + equal + quickSort(a: greater)
        }
    }
    
    func partitionLomuto<T: Comparable>( a: inout [T], low: Int, high: Int) -> Int {
        let pivot = a[high]
        
        var i = low
        for j in low..<high {
            if a[j] <= pivot {
                (a[i], a[j]) = (a[j], a[i])
                i += 1
            }
        }
        
        (a[i], a[high]) = (a[high], a[i])
        
        return 0
    }
    
    func partitionHoare<T: Comparable>( a: inout [T], low: Int, high: Int) -> Int {
        let pivot = a[low]
        var i = low - 1
        var j = high + 1
        
        while true {
            repeat { j -= 1 } while a[j] > pivot
            repeat { i += 1 } while a[i] < pivot
            
            if i < j {
                a.swapAt(i, j)
            } else {
                return j
            }
        }
    }
    
    func quickSortLomuto<T: Comparable>(a: inout [T], low: Int, high: Int){
        let p = partitionLomuto(a: &a, low: low, high: high)
        if low < high {
            quickSortLomuto(a: &a, low: low, high: p - 1)
            quickSortLomuto(a: &a, low: p + 1, high: high)
        }
    }
    
    func quicksortHoare<T: Comparable>( a: inout [T], low: Int, high: Int) {
        if low < high {
            let p = partitionHoare(a: &a, low: low, high: high)
            quicksortHoare(a: &a, low: low, high: p)
            quicksortHoare(a: &a, low: p + 1, high: high)
        }
    }
    
    func quicksortRandom<T: Comparable>( a: inout [T], low: Int, high: Int) {
        if low < high {
            let pivotIndex = Int.random(in: low...high)        // 1
            
            (a[pivotIndex], a[high]) = (a[high], a[pivotIndex])  // 2
            
            let p = partitionLomuto(a: &a, low: low, high: high)
            quicksortRandom(a: &a, low: low, high: p - 1)
            quicksortRandom(a: &a, low: p + 1, high: high)
        }
    }
}
