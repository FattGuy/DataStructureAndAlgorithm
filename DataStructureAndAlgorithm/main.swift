//
//  main.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 10/30/17.
//  Copyright © 2017 Feng Chang. All rights reserved.
//

import Foundation

let list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]

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

print(quickSort(a: list))
