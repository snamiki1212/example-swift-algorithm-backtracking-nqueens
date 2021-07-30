//
//  main.swift
//  queens
//
//  Created by shunnamiki on 2021/07/30.
//

import Foundation

// ----------------
var board = Board.init(size: 8)
print("=======")
solve8Queens(board: &board, type: Type.all)
print("total: ", total, "numOfPossibility: ", numOfPossibility)
print("=======")
board = Board.init(size: 8)
solve8Queens(board: &board, type: Type.first)
print("total: ", total, "numOfPossibility: ", numOfPossibility)
print("=======")
