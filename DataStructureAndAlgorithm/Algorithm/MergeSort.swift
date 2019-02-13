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
    func mergeSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else {
            return array
        }
        
        let midIndex = array.count / 2
        
        let left = mergeSort(Array(array[0..<midIndex]))
        let right = mergeSort(Array(array[midIndex..<array.count]))
        
        return merge(left, right)
    }
    
    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var orderedArray = [Int]()
        //Start from here
        
        
        
        return orderedArray
    }
}
