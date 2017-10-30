//
//  Stack.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 10/27/17.
//  Copyright © 2017 Feng Chang. All rights reserved.
//

import Foundation

struct Stack<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T {
        return array.removeLast()
    }
    
    public var top: T? {
        return array.last
    }
}

