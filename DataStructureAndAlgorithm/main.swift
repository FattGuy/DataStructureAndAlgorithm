//
//  main.swift
//  DataStructureAndAlgorithm
//
//  Created by Feng Chang on 10/30/17.
//  Copyright © 2017 Feng Chang. All rights reserved.
//

import Foundation

var union = UnionFind<Int>()
union.addSetWith(2)
union.addSetWith(7)
union.addSetWith(4)

print(union.unionSetsContaining(2, and: 4))
