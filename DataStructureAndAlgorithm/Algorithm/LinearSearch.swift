//
//  LinearSearch.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 2/17/19.
//  Copyright © 2019 Feng Chang. All rights reserved.
//

import Foundation

class LinearSearch {
    func linearSearch<T: Equatable>(_ array: [T], object: T) -> Int? {
        for (index, obj) in array.enumerated() where obj == object {
            return index
        }
        
        return nil
    }
}
