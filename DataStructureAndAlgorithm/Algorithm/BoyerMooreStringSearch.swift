//
//  BoyerMooreStringSearch.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 2/16/19.
//  Copyright © 2019 Feng Chang. All rights reserved.
//

import Foundation

extension String {
    //Brute-Force String Search
    func indexOf(_ pattern: String) -> String.Index? {
        for i in self.indices {
            var j = i
            var found = true
            for p in pattern.indices{
                if j == self.endIndex || self[j] != pattern[p] {
                    found = false
                    break
                } else {
                    j = self.index(after: j)
                }
            }
            if found {
                return i
            }
        }
        return nil
    }
}

extension String {
    func indexOfCopy(_ pattern: String) -> String.Index? {
        let patternLength = pattern.count
        guard patternLength > 0, patternLength <= self.count else { return nil }
        
        var skipTable = [Character: Int]()
        for (i, c) in pattern.enumerated() {
            skipTable[c] = patternLength - i - 1
        }
        
        let p = pattern.index(before: pattern.endIndex)
        let lastChar = pattern[p]
        
        var i = index(startIndex, offsetBy: patternLength - 1)
        
        func backwards() -> Index? {
            var q = p
            var j = i
            
            while q > pattern.startIndex {
                q = index(before: q)
                j = index(before: j)
                
                if self[j] != pattern[q] { return nil }
            }
            
            return j
        }
        
        while i < endIndex {
            let c = self[i]
            
            if c == lastChar {
                if let k = backwards() {
                    return k
                }
                // Original Version
//                // If no match, we can only safely skip one character ahead.
//                i = index(after: i)
                let jumpOffset = max(skipTable[c] ?? patternLength, 1)
                //Horspol Version
                i = index(i, offsetBy: jumpOffset, limitedBy: endIndex) ?? endIndex
            } else {
                i = index(i, offsetBy: skipTable[c] ?? patternLength, limitedBy: endIndex) ?? endIndex
            }
        }
        
        return nil
    }
}
