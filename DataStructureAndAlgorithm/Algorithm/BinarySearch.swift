//
//  BinarySearch.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 11/2/17.
//  Copyright © 2017 Feng Chang. All rights reserved.
//

import Foundation

class BinarySearch {
    func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
        let low = range.lowerBound
        let high = range.upperBound
        if low > high {
            return nil
        } else {
            let midIndex = low + (high - low) / 2
            if key > a[midIndex] {
                return binarySearch(a, key: key, range: midIndex..<high)
            } else if key < a[midIndex] {
                return binarySearch(a, key: key, range: 0..<midIndex)
            } else{
                return midIndex
            }
        }
    }
}
