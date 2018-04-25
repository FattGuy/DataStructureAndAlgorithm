//
//  main.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 10/30/17.
//  Copyright © 2017 Feng Chang. All rights reserved.
//

import Foundation

//Stack test
var myStack = Stack<Any>()
myStack.push(1)
myStack.push(2)
print(myStack)

let insert = InsertionSort()
let strings = [ "b", "a", "d", "c", "e" ]
print(insert.insertionSort(strings, <))

let binary = BinarySearch()
let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
print(binary.binarySearch(numbers, key: 23, range: 0..<numbers.count)!)




