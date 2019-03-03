//
//  HeapSort.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 3/3/19.
//  Copyright © 2019 Feng Chang. All rights reserved.
//

import Foundation

extension Heap {
    public mutating func sort() -> [T] {
        for i in stride(from: elements.count - 1, through: 1, by: -1) {
            elements.swapAt(0, i)
            shiftDown(index: 0, heapSize: i)
        }
        return elements
    }
}
