//
//  Array2D.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 3/16/19.
//  Copyright © 2019 Feng Chang. All rights reserved.
//

import Foundation

class Array2D<T> {
    public let columns: Int
    public let rows: Int
    fileprivate var array: [T]
    
    public init(columns: Int, rows: Int, initialValue: T) {
        self.columns = columns
        self.rows = rows
        self.array = Array(repeating: initialValue, count: columns * rows)
    }
    
    public subscript(column: Int, row: Int) -> T {
        get {
            precondition(column < columns, "column is too small")
            precondition(row < rows, "row is too small")
            return array[row * columns + column]
        }
        
        set {
            precondition(column < columns, "column is too small")
            precondition(row < rows, "row is too small")
            array[row * columns + column] = newValue
        }
    }
}
