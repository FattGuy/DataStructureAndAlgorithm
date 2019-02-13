//
//  main.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 10/30/17.
//  Copyright © 2017 Feng Chang. All rights reserved.
//

import Foundation

let array = [7, 2, 6, 3, 9]

func mergeSort(_ array: [Int]) -> [Int] {
    // 1
    print(array)
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    // 2
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var orderedArray = [Int]()
    var leftIndex = 0
    var rightIndex = 0
    // 1
    while leftIndex < left.count && rightIndex < right.count {
        // challenge!
        // 1
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement { // 2
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement { // 3
            orderedArray.append(rightElement)
            rightIndex += 1
        } else { // 4
            orderedArray.append(leftElement)
            leftIndex += 1
            orderedArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    // 2
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}

print(mergeSort(array))



