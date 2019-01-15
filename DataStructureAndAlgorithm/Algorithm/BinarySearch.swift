//
//  BinarySearch.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 11/2/17.
//  Copyright © 2017 Feng Chang. All rights reserved.
//

import Foundation

class BinarySearch {
    //Recursive
    func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
        let low = range.lowerBound
        let high = range.upperBound
        if low > high {
            return nil
        } else {
            let midIndex = low + (high - low) / 2
            if key > a[midIndex] {
                return binarySearch(a, key: key, range: midIndex + 1..<high)
            } else if key < a[midIndex] {
                return binarySearch(a, key: key, range: low..<midIndex)
            } else{
                return midIndex
            }
        }
    }
    
    //Iterative
    func binarySearchIterative<T: Comparable>(_ a: [T], key: T) -> Int? {
        var low = 0
        var high = a.count
        let midIndex = low + (high - low) / 2
        while low < high {
            if a[midIndex] == key {
                return midIndex
            } else if a[midIndex] > key {
                high = midIndex
            } else {
                low = midIndex + 1
            }
        }
        
        return nil
    }
}
