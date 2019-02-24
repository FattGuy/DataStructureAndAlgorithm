//
//  KthLargestNumber.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 2/19/19.
//  Copyright © 2019 Feng Chang. All rights reserved.
//

import Foundation

class KthLargestNumber<T: Comparable> {
//    var array: [T]?
//    
//    func kthLargestNumber(_ array: [Int], k: Int) -> Int? {
//        let len = array.count
//        if k > 0 && k <= len {
//            let sorted = array.sorted()
//            return sorted[len - k]
//        } else {
//            return nil
//        }
//    }
    
    public func randomizedSelect<T: Comparable>(_ array: [T], order k: Int) -> T {
        var a = array
        
        func randomPivot<T: Comparable>(_ a: inout [T], _ low: Int, _ high: Int) -> T {
            let pivotIndex = Int.random(in: low...high)
            a.swapAt(pivotIndex, high)
            return a[high]
        }
        
        func randomizedPartition<T: Comparable>(_ a: inout [T], _ low: Int, _ high: Int) -> Int {
            let pivot = randomPivot(&a, low, high)
            var i = low
            for j in low..<high {
                if a[j] <= pivot {
                    a.swapAt(i, j)
                    i += 1
                }
            }
            a.swapAt(i, high)
            return i
        }
        
        func randomizedSelect<T: Comparable>(_ a: inout [T], _ low: Int, _ high: Int, _ k: Int) -> T {
            if low < high {
                let p = randomizedPartition(&a, low, high)
                if k == p {
                    return a[p]
                } else if k < p {
                    return randomizedSelect(&a, low, p - 1, k)
                } else {
                    return randomizedSelect(&a, p + 1, high, k)
                }
            } else {
                return a[low]
            }
        }
        
        precondition(a.count > 0)
        return randomizedSelect(&a, 0, a.count - 1, k)
    }
}
