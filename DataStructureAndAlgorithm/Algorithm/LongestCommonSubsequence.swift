//
//  LongestCommonSubsequence.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 2/25/19.
//  Copyright © 2019 Feng Chang. All rights reserved.
//

import Foundation

extension String {
    public func longestCommonSubsequence(_ other: String) -> String {
        func lcsLength(other: String) -> [[Int]] {
            var matrix = [[Int]](repeating: [Int](repeating: 0, count: other.count + 1), count: self.count + 1)
            for (i, selfChar) in self.enumerated() {
                for (j, otherChar) in other.enumerated() {
                    if otherChar == selfChar {
                        // Common char found, add 1 to highest lcs found so far.
                        matrix[i+1][j+1] = matrix[i][j] + 1
                    } else {
                        // Not a match, propagates highest lcs length found so far.
                        matrix[i+1][j+1] = max(matrix[i][j+1], matrix[i+1][j])
                    }
                }
            }
            
            return matrix
        }
        
        func backTrack(matrix: [[Int]]) -> String {
            var i = self.count
            var j = other.count
            var charInSequence = self.endIndex
            
            var result = String()
            
            while i >= 1 && j >= 1 {
                if matrix[i][j] == matrix[i][j - 1] {
                    j -= 1
                } else if matrix[i][j] == matrix[i - 1][j] {
                    i -= 1
                    charInSequence = self.index(before: charInSequence)
                } else {
                    i -= 1
                    j -= 1
                    charInSequence = self.index(before: charInSequence)
                    result.append(self[charInSequence])
                }
            }
            
            return String(result.reversed())
        }
        
        return backTrack(matrix: lcsLength(other: other))
    }
}
