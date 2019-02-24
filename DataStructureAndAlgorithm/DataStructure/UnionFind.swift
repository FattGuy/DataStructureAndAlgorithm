//
//  UnionFind.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 2/24/19.
//  Copyright © 2019 Feng Chang. All rights reserved.
//

import Foundation

public struct UnionFind<T: Hashable> {
    private var index = [T: Int]()
    private var parent = [Int]()
    private var size = [Int]()
    
    public mutating func setOf(_ element: T) -> Int? {
        if let indexOfElement = index[element] {
            return setByIndex(indexOfElement)
        } else {
            return nil
        }
    }
    
    public mutating func addSetWith(_ element: T) {
        index[element] = parent.count  // 1
        parent.append(parent.count)    // 2
        size.append(1)                 // 3
    }
    
    private mutating func setByIndex(_ index: Int) -> Int {
        if parent[index] == index {  // 1
            return index
        } else {
            parent[index] = setByIndex(parent[index])  // 2
            return parent[index]       // 3
        }
    }
}
