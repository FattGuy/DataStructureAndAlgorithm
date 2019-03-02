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
}
