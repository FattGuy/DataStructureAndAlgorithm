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
    
    func selectFromProbability<T>(from a: [T], count requested: Int) -> [T] {
        var examinted = 0
        var selected = 0
        var b = [T]()
        
        while selected < requested {
            let r = Double(arc4random()) / 0x100000000
            
            let leftToExamine = a.count - examinted
            let leftToAdd = requested - selected
            
            if Double(leftToExamine) * r < Double(leftToAdd) {
                selected += 1
                b.append(a[examinted])
            }
            
            examinted += 1
        }
        return b
    }
}
