//
//  main.swift
//  queens
//
//  Created by shunnamiki on 2021/07/30.
//

import Foundation

// ----------------
var board: Board;

// All case
print("=======")
board = Board.init(size: 8)
solve8Queens(board: &board, type: Type.all)
print("total call num: ", total, "numOfCase: ", numOfCase)

// First case
print("=======")
board = Board.init(size: 8)
solve8Queens(board: &board, type: Type.first)
print("total call num: ", total, "numOfCase: ", numOfCase)

