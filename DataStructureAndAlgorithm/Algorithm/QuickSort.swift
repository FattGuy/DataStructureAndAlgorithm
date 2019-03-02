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
    
    func quickSortLomuto<T: Comparable>(a: inout [T], low: Int, high: Int){
        let p = partitionLomuto(a: &a, low: low, high: high)
        if low < high {
            quickSortLomuto(a: &a, low: low, high: p - 1)
            quickSortLomuto(a: &a, low: p + 1, high: high)
        }
    }
}
