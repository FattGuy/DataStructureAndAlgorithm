//
//  MergeSort.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 2/11/19.
//  Copyright © 2019 Feng Chang. All rights reserved.
//

import Foundation

//Basic
class MergeSort {
    func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
        // 1
        guard array.count > 1 else { return array }
        
        let middleIndex = array.count / 2
        
        // 2
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        print("1",leftArray, rightArray)
        //    print("2", merge(leftArray, rightArray))
        return merge(leftArray, rightArray)
    }
    
    func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
        var orderedArray = [T]()
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
        
        print("2", orderedArray)
        return orderedArray
    }
}
