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
    
    //A another way of merge sort
    func mergeSortBottomUp<T>(_ a: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
        let n = a.count
        
        var z = [a, a]      // 1
        var d = 0
        var width = 1
        while width < n {   // 2
            var i = 0
            while i < n {     // 3
                var j = i
                var l = i
                var r = i + width
                
                let lmax = min(l + width, n)
                let rmax = min(r + width, n)
                
                while l < lmax && r < rmax {                // 4
                    if isOrderedBefore(z[d][l], z[d][r]) {
                        z[1 - d][j] = z[d][l]
                        l += 1
                    } else {
                        z[1 - d][j] = z[d][r]
                        r += 1
                    }
                    j += 1
                }
                while l < lmax {
                    z[1 - d][j] = z[d][l]
                    j += 1
                    l += 1
                }
                while r < rmax {
                    z[1 - d][j] = z[d][r]
                    j += 1
                    r += 1
                }
                i += width*2
            }
            width *= 2
            d = 1 - d      // 5
        }
        
        return z[d]
    }
}
