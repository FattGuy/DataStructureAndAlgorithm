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
        if index != parent[index] {
            // Updating parent index while looking up the index of parent.
            parent[index] = setByIndex(parent[index])
        }
        return parent[index]
    }
    
    public mutating func inSameSet(_ firstElement: T, and secondElement: T) -> Bool {
        if let firstSet = setOf(firstElement), let secondSet = setOf(secondElement) {
            return firstSet == secondSet
        } else {
            return false
        }
    }
    
    public mutating func unionSetsContaining(_ firstElement: T, and secondElement: T) {
        if let firstSet = setOf(firstElement), let secondSet = setOf(secondElement) { // 1
            if firstSet != secondSet {                // 2
                if size[firstSet] < size[secondSet] { // 3
                    parent[firstSet] = secondSet      // 4
                    size[secondSet] += size[firstSet] // 5
                } else {
                    parent[secondSet] = firstSet
                    size[firstSet] += size[secondSet]
                }
            }
        }
    }
}
