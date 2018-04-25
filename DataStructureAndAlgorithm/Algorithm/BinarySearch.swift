//
//  BinarySearch.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 11/2/17.
//  Copyright © 2017 Feng Chang. All rights reserved.
//

import Foundation

class BinarySearch {
    func binarySearch<T: Comparable>(_ array: [T], key: T, range: Range<Int>) -> Int? {
        if range.lowerBound >= range.upperBound {
            return nil
        } else {
            let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
            if array[midIndex] > key {
                return binarySearch(array, key: key, range: range.lowerBound..<midIndex)
            } else if array[midIndex] < key {
                return binarySearch(array, key: key, range: midIndex + 1..<range.upperBound)
            } else {
                return midIndex
            }
        }
    }
}
