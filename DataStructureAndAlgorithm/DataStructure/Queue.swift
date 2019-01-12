//
//  Queue.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 10/27/17.
//  Copyright © 2017 Feng Chang. All rights reserved.
//

import Foundation

struct Queue<T> {
    fileprivate var queue = [T]()
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public var count: Int {
        return queue.count
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return queue.removeFirst()
        }
    }
    
    public mutating func enqueue(element: T) {
        queue.append(element)
    }
    
    public mutating func peek() -> T? {
        return queue.first
    }
}
