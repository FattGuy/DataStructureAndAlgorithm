//
//  OrderedArray.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 5/11/19.
//  Copyright © 2019 Feng Chang. All rights reserved.
//

import Foundation

struct OrderedArray<T: Comparable> {
    fileprivate var array: [T]
    
    public init(array: [T]) {
        self.array = array.sorted()
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public subscript(index: Int) -> T {
        return array[index]
    }
    
    public mutating func removeAt(index: Int) -> T{
        return array.remove(at: index)
    }
    
    public mutating func removeAll() {
        return array.removeAll()
    }
    
    public mutating func insert(_ newElement: T) -> Int {
        let index = findInsertionPoint(newElement)
        array.insert(newElement, at: index)
        return index
    }
    
    private func findInsertionPoint(_ newElement: T) -> Int {
        for i in 0..<array.count {
            if newElement <= array[i] {
                return i
            }
        }
        
        return array.count
    }
    
    private func findInsertionPointInBinarySearch(_ newElement: T) -> Int {
        var startIndex = 0
        var endIndex = array.count
        let midIndex = startIndex + (endIndex - startIndex) / 2
        
        while startIndex < endIndex {
            if array[midIndex] == newElement {
                return midIndex
            } else if array[midIndex] < newElement {
                startIndex = midIndex + 1
            } else if array[midIndex] > newElement {
                endIndex = midIndex
            }
        }
        
        return startIndex
    }
}

extension OrderedArray: CustomStringConvertible {
    public var description: String {
        return array.description
    }
}
