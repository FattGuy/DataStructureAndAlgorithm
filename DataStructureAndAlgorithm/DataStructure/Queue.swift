//
//  Queue.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 10/27/17.
//  Copyright © 2017 Feng Chang. All rights reserved.
//

import Foundation

struct Queue<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if array.isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public var front: T? {
        return array.first
    }
}
