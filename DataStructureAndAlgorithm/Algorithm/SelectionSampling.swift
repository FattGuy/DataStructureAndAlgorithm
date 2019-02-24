//
//  SelectionSampling.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 2/23/19.
//  Copyright © 2019 Feng Chang. All rights reserved.
//

import Foundation

class SelectionSampling {
    func select<T>(from a: [T], count k: Int) -> [T] {
        var a = a
        for i in 0..<k {
            let r = Int.random(in: i..<a.count)
            if i != r {
                a.swapAt(i, r)
            }
        }
        return Array(a[0..<k])
    }
    
    func reserviorSampling<T>(from a: [T], count k: Int) -> [T] {
        precondition(a.count >= k)
        
        var result = [T]()
        for i in 0..<k {
            result.append(a[i])
        }
        
        for i in k..<a.count {
            let j = Int.random(in: 0...i)
            if j < k {
                result[j] = a[i]
            }
        }
        
        return result
    }
}
