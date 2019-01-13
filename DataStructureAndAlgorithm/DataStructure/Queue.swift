//
//  Queue.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 10/27/17.
//  Copyright © 2017 Feng Chang. All rights reserved.
//

import Foundation

struct Queue<T> {
    fileprivate var queue = [T?]()
    private var head = 0
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public var count: Int {
        return queue.count
    }
    
    public mutating func dequeue() -> T? {
        guard head < queue.count, let element = queue[head] else {
            return nil
        }
        
        queue[head] = nil
        head += 1
        
        let percentage = Double(head)/Double(queue.count)
        if queue.count > 50 && percentage > 0.25 {
            queue.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    public mutating func enqueue(element: T) {
        queue.append(element)
    }
    
    public mutating func peek() -> T? {
        if isEmpty {
            return nil
        } else {
           return queue[head]
        }
    }
}
