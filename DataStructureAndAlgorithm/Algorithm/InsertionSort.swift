//
//  InsertionSort.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 10/30/17.
//  Copyright © 2017 Feng Chang. All rights reserved.
//

import Foundation

class InsertionSort {
    
//    func insertionSort(_ array:[Int]) -> [Int] {
//        var a = array
//        for x in 1..<a.count {
//            var y = x
//            //let temp = a[y]
//            while y > 0 && a[y] /* temp */ < a[y - 1] {
//                //a[y] = a[y - 1]
//                a.swapAt(y - 1, y)
//                y -= 1
//            }
//            //a[y] = temp
//        }
//        return a
//    }
    
    // The generic way
    func insertionSort<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
        var a = array
        for x in 1..<a.count {
            var y = x
            let temp = a[y]
            while y > 0 && isOrderedBefore(temp, a[y - 1]) {
                //a.swapAt(y - 1, y)
                a[y] = a[y - 1]
                y -= 1
            }
            a[y] = temp
        }
        return a
    }
}
// The commented code is the destail steps of swapping
